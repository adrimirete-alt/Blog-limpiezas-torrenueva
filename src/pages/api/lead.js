export const prerender = false;

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
    import.meta.env.PUBLIC_SUPABASE_URL,
    import.meta.env.PUBLIC_SUPABASE_ANON_KEY
);

const BREVO_API_KEY = import.meta.env.BREVO_API_KEY;
const BREVO_LIST_ID = parseInt(import.meta.env.BREVO_LIST_ID || '0', 10);
const NOTIFICATION_EMAIL = 'info@limpiezastorrenueva.com';

function calcularPresupuesto({ tipo_propiedad, m2, frecuencia }) {
    const baseM2 = {
        comunidad: 1.5,
        oficina: 2.5,
        garaje: 1.0,
        industrial: 1.8,
        otro: 2.0,
    };
    const freqMultiplier = {
        diaria: 4.0,
        semanal: 2.5,
        quincenal: 1.8,
        mensual: 1.0,
        puntual: 0.5,
    };
    const base = (baseM2[tipo_propiedad] || 2.0) * (m2 || 100);
    const mult = freqMultiplier[frecuencia] || 1.5;
    const total = base * mult;
    return {
        min: Math.round(total * 0.85),
        max: Math.round(total * 1.25),
    };
}

function calcularScore({ tipo_propiedad, m2, telefono, email, frecuencia, localidad }) {
    let score = 0;
    if (telefono && telefono.length >= 9) score += 30;
    if (email && email.includes('@')) score += 20;
    if (m2 && m2 >= 200) score += 15;
    if (m2 && m2 >= 1000) score += 15;
    if (['diaria', 'semanal'].includes(frecuencia)) score += 20;
    if (['comunidad', 'industrial'].includes(tipo_propiedad)) score += 15;
    if (localidad) score += 5;
    return Math.min(score, 100);
}

async function addToBrevo({ nombre, email, telefono, fuente }) {
    if (!BREVO_API_KEY || !BREVO_LIST_ID) return;
    try {
        await fetch('https://api.brevo.com/v3/contacts', {
            method: 'POST',
            headers: {
                'accept': 'application/json',
                'content-type': 'application/json',
                'api-key': BREVO_API_KEY,
            },
            body: JSON.stringify({
                email,
                attributes: { NOMBRE: nombre, TELEFONO: telefono, FUENTE: fuente },
                listIds: [BREVO_LIST_ID],
                updateEnabled: true,
            }),
        });
    } catch (e) {
        console.error('Brevo error:', e);
    }
}

async function notifyTeam(lead) {
    if (!BREVO_API_KEY) return;
    try {
        await fetch('https://api.brevo.com/v3/smtp/email', {
            method: 'POST',
            headers: {
                'accept': 'application/json',
                'content-type': 'application/json',
                'api-key': BREVO_API_KEY,
            },
            body: JSON.stringify({
                sender: { name: 'Web Torrenueva', email: 'noreply@limpiezastorrenueva.com' },
                to: [{ email: NOTIFICATION_EMAIL, name: 'Limpiezas Torrenueva' }],
                subject: `🔔 Nuevo lead (${lead.fuente}) — ${lead.nombre || lead.email || 'sin nombre'}`,
                htmlContent: `
                    <h2>Nuevo lead recibido</h2>
                    <ul>
                        <li><strong>Nombre:</strong> ${lead.nombre || '—'}</li>
                        <li><strong>Email:</strong> ${lead.email || '—'}</li>
                        <li><strong>Teléfono:</strong> ${lead.telefono || '—'}</li>
                        <li><strong>Tipo:</strong> ${lead.tipo_propiedad || '—'}</li>
                        <li><strong>Localidad:</strong> ${lead.localidad || '—'}</li>
                        <li><strong>m²:</strong> ${lead.m2 || '—'}</li>
                        <li><strong>Frecuencia:</strong> ${lead.frecuencia || '—'}</li>
                        <li><strong>Presupuesto estimado:</strong> ${lead.presupuesto_estimado_min || '—'}–${lead.presupuesto_estimado_max || '—'} €</li>
                        <li><strong>Score:</strong> ${lead.score_cualificacion}/100</li>
                        <li><strong>Fuente:</strong> ${lead.fuente}</li>
                        <li><strong>Mensaje:</strong> ${lead.mensaje || '—'}</li>
                    </ul>
                    <p><a href="https://limpiezastorrenueva.com/admin/leads">Ver en panel admin →</a></p>
                `,
            }),
        });
    } catch (e) {
        console.error('Notify error:', e);
    }
}

export async function POST({ request, clientAddress }) {
    try {
        const body = await request.json();
        const {
            nombre, email, telefono,
            tipo_propiedad, localidad, m2, frecuencia,
            servicios_extra, mensaje,
            fuente = 'web',
            consent_rgpd, consent_marketing,
        } = body;

        // Validación básica
        if (!consent_rgpd) {
            return new Response(JSON.stringify({ error: 'Debes aceptar la política de privacidad.' }), { status: 400, headers: { 'content-type': 'application/json' } });
        }
        if (!email && !telefono) {
            return new Response(JSON.stringify({ error: 'Email o teléfono obligatorio.' }), { status: 400, headers: { 'content-type': 'application/json' } });
        }

        const presupuesto = calcularPresupuesto({ tipo_propiedad, m2, frecuencia });
        const score = calcularScore({ tipo_propiedad, m2, telefono, email, frecuencia, localidad });

        const lead = {
            nombre, email, telefono,
            tipo_propiedad, localidad, m2: parseInt(m2) || null, frecuencia,
            servicios_extra: servicios_extra || [],
            mensaje,
            fuente,
            presupuesto_estimado_min: presupuesto.min,
            presupuesto_estimado_max: presupuesto.max,
            score_cualificacion: score,
            consent_rgpd: !!consent_rgpd,
            consent_marketing: !!consent_marketing,
            consent_ip: clientAddress || null,
        };

        const { error } = await supabase.from('leads').insert([lead]);
        if (error) {
            console.error('Supabase insert error:', error);
            return new Response(JSON.stringify({ error: 'Error guardando lead.' }), { status: 500, headers: { 'content-type': 'application/json' } });
        }

        // Brevo + notificación email (no bloquean la respuesta)
        if (consent_marketing && email) addToBrevo({ nombre, email, telefono, fuente });
        notifyTeam(lead);

        return new Response(JSON.stringify({
            ok: true,
            presupuesto,
            score,
            message: 'Lead registrado correctamente.',
        }), { status: 200, headers: { 'content-type': 'application/json' } });

    } catch (e) {
        console.error('Lead API error:', e);
        return new Response(JSON.stringify({ error: 'Error procesando solicitud.' }), { status: 500, headers: { 'content-type': 'application/json' } });
    }
}
