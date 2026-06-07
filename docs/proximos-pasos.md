# Próximos pasos — Roadmap para llegar al Top 3 local

## 🔥 ACCIONES INMEDIATAS (esta semana)

### 1. Desplegar la web a producción
- [ ] Conectar el repositorio a Vercel
- [ ] Configurar variables de entorno en Vercel:
    - `PUBLIC_SUPABASE_URL`
    - `PUBLIC_SUPABASE_ANON_KEY`
    - `SUPABASE_SERVICE_ROLE_KEY`
    - `BREVO_API_KEY` (opcional pero recomendado)
    - `BREVO_LIST_ID` (opcional)
- [ ] Configurar el dominio `limpiezastorrenueva.com` apuntando a Vercel
- [ ] Verificar que el redirect `/maquinas` → `/maquinaria` funciona en producción

### 2. Supabase — ejecutar 3 scripts
En el SQL Editor de tu proyecto Supabase, ejecuta en este orden:
1. `supabase_blog_v2.sql` — añade columnas y políticas al blog
2. `supabase_seed_posts.sql` — inserta los 5 artículos seed
3. `supabase_leads.sql` — crea la tabla de leads

Después, crea el usuario admin en Authentication > Users (email: info@limpiezastorrenueva.com).

### 3. Google Search Console
- [ ] Verificar propiedad del dominio
- [ ] Enviar sitemap: `https://limpiezastorrenueva.com/sitemap-index.xml`
- [ ] Solicitar indexación manualmente de las 9 páginas de zonas y los 5 artículos seed

### 4. Google Business Profile
Seguir el documento `google-business-profile.md` íntegramente.
**Esta es la acción individual con mayor impacto en captación local.** Dedica 1-2h.

### 5. Brevo (email marketing)
- [ ] Crear cuenta gratuita en brevo.com
- [ ] Verificar dominio limpiezastorrenueva.com (DNS records de SPF y DKIM)
- [ ] Crear lista "Leads web Torrenueva"
- [ ] Copiar API Key + List ID y añadirlos a Vercel
- [ ] Crear las 7 plantillas de email del nurturing (ver más abajo)

---

## 📅 ACCIONES MES 1

### Contenidos
- [ ] Publicar 4-8 artículos del plan editorial (orden sugerido en `plan-editorial-50-articulos.md`)
- [ ] Empezar a publicar 2 posts/semana en Google Business Profile
- [ ] Subir 10 fotos nuevas a GBP

### Reseñas
- [ ] Pedir reseña a TODOS los clientes activos por WhatsApp/email
- [ ] Objetivo: 10 nuevas reseñas en 30 días

### Link building local (citaciones)
Inscribirte en los siguientes directorios con NAP idéntico (Nombre, Dirección, Teléfono):
- [ ] Páginas Amarillas
- [ ] Empresite
- [ ] Axesor
- [ ] Yelp España
- [ ] Foursquare
- [ ] Bing Places
- [ ] Apple Maps
- [ ] Hotfrog
- [ ] Trovit
- [ ] Tuugo
- [ ] Cylex
- [ ] Y directorios locales (Torrevieja.com, asociaciones del comercio local)

### Outbound legal B2B
- [ ] Listar todos los administradores de fincas de Torrevieja, Orihuela y Vega Baja
- [ ] Visita comercial 1-2/semana
- [ ] LinkedIn outreach personalizado (no masivo) a 5 administradores/semana

---

## 📅 ACCIONES MES 2-3

### Contenidos
- [ ] Mantener cadencia 2 posts/semana (objetivo: 20 artículos publicados al final del mes 3)
- [ ] Empezar a buscar guest posts en blogs de administradores de fincas, inmobiliarias y portales locales

### SEO técnico
- [ ] Auditoría con Screaming Frog cada mes
- [ ] Lighthouse mensual con objetivo Performance >90, SEO >95
- [ ] Revisar Search Console: errores, CTR, posiciones medias

### Reseñas
- [ ] Mantener ritmo +5/mes mínimo
- [ ] Responder TODAS las reseñas (positivas y negativas) en <48h

### Link building avanzado
- [ ] Contactar con periódicos locales (El Mira, La Verdad Vega Baja) para una nota de prensa o entrevista
- [ ] Patrocinar evento local pequeño con enlace en su web
- [ ] Buscar 2-3 dominios EXPIRADOS de la zona y comprarlos para redirigir 301

---

## 📅 ACCIONES MES 4-6

### Google Ads
Una vez la web esté optimizada y el funnel funcione:
- [ ] Lanzar campañas Google Ads (Search) para keywords transaccionales locales
- [ ] Presupuesto inicial sugerido: 300-500 €/mes
- [ ] Landing pages específicas para cada campaña
- [ ] Conversión = formulario o llamada (configurar conversiones GA4)

### Email Marketing
- [ ] Newsletter mensual a la lista de Brevo con últimos artículos + caso de éxito
- [ ] Segmentar lista por tipo de propiedad

### Vídeo / YouTube
- [ ] Crear canal de YouTube y publicar vídeos cortos (60s) de:
    - Antes/después de limpiezas reales
    - Cómo usamos la fregadora industrial
    - Testimonios de clientes en vídeo
- [ ] Incrustar vídeos en posts del blog (mejora dwell time = SEO)

---

## 🎯 OBJETIVOS POR TRIMESTRE

| Trimestre | Tráfico orgánico/mes | Leads/mes | Reseñas | Posición media keywords clave |
|---|---|---|---|---|
| T1 | 500 | 20-40 | +10 (total 25+) | Top 20 |
| T2 | 1.500 | 50-100 | +20 (total 50+) | Top 10 |
| T3 | 3.500 | 100-200 | +30 (total 100+) | Top 5 |
| T4 | 6.000+ | 200-400 | +40 (total 150+) | **Top 3 estable** |

---

## 🧠 Las 7 plantillas de email para Brevo (nurturing)

Crea estas plantillas en Brevo > Email > Templates y configura una automatización que las envíe en serie al ser añadido a la lista.

### Email 1 — Bienvenida (inmediato)
> **Asunto:** Tu presupuesto orientativo de limpieza está en camino
>
> Hola [NOMBRE],
>
> Acabamos de recibir tu solicitud desde la calculadora. En menos de 24 horas recibirás tu presupuesto exacto por email y una llamada para resolver cualquier duda.
>
> Mientras tanto:
> 📞 Si lo prefieres puedes llamarnos directamente al 604 438 618
> 💬 También por WhatsApp: [enlace]
>
> Un saludo,
> Equipo de Limpiezas Torrenueva

### Email 2 — Caso de éxito (día 1)
> **Asunto:** Cómo Comunidad X redujo el coste de limpieza un 18% con nosotros
>
> [Cuerpo: historia de un cliente real con resultado concreto]

### Email 3 — Las 3 dudas más comunes (día 3)
> **Asunto:** Las 3 dudas que más nos preguntan en Torrevieja
>
> [Cuerpo: precio medio, frecuencia óptima, qué incluye el servicio]

### Email 4 — Testimonios (día 5)
> **Asunto:** Lo que dicen las comunidades de Orihuela Costa de nosotros
>
> [Cuerpo: 3-4 testimonios + foto del equipo]

### Email 5 — Oferta (día 8)
> **Asunto:** Presupuesto sin compromiso esta semana — visita gratis
>
> [Cuerpo: invitar a confirmar la visita técnica]

### Email 6 — Contenido del blog (día 12)
> **Asunto:** 5 preguntas clave antes de contratar una empresa de limpieza
>
> [Cuerpo: link al artículo correspondiente del blog]

### Email 7 — Última llamada (día 18)
> **Asunto:** ¿Pasamos a saludar?
>
> [Cuerpo: oferta de visita técnica gratuita + descuento puntual primer mes]

---

## ✅ MANTENIMIENTO MENSUAL

Cada primer lunes de mes, dedicar 1h a:
- [ ] Revisar Search Console (errores, nuevas keywords)
- [ ] Revisar Lighthouse (performance, SEO)
- [ ] Publicar 2 posts en blog (ya planificados en `plan-editorial-50-articulos.md`)
- [ ] Subir 5 fotos nuevas a GBP
- [ ] Publicar 4-8 posts en GBP
- [ ] Pedir reseñas a los clientes del mes
- [ ] Responder todas las reseñas
- [ ] Revisar /admin/leads y dar seguimiento a los nuevos

Cada trimestre:
- [ ] Auditoría completa de la web
- [ ] Revisar competencia local (qué hacen mejor, qué keywords usan)
- [ ] Reunión interna: revisar leads → clientes, calcular CAC y LTV

---

## 🆘 ¿Necesitas ayuda en algún punto?

Si tienes dudas técnicas con cualquiera de estos pasos, el código está documentado y se puede iterar sobre cualquier parte. Lo más complejo (Brevo + Vercel deploy) son tareas de 15-30 min cada una.
