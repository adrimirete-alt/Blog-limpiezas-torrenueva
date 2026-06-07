# ✅ Checklist de despliegue (lo único que tienes que hacer tú)

Esta es la guía paso a paso, en orden, de las **acciones manuales** que necesitan tu intervención porque requieren acceso a servicios externos.

---

## PASO 1 — Supabase (5 min)

Ve a https://supabase.com/dashboard/project/gascwpcmwvsgqyjrosiu/sql/new

Ejecuta los 3 scripts SQL **en este orden**:

1. **Copia y pega el contenido de** [`supabase_blog_v2.sql`](../supabase_blog_v2.sql) → Run
2. **Copia y pega el contenido de** [`supabase_seed_posts.sql`](../supabase_seed_posts.sql) → Run
3. **Copia y pega el contenido de** [`supabase_leads.sql`](../supabase_leads.sql) → Run

Luego ve a https://supabase.com/dashboard/project/gascwpcmwvsgqyjrosiu/auth/users → **Add user > Create new user**:

- Email: `info@limpiezastorrenueva.com`
- Password: `katpyc-jugny5-dUnciq` (la que ya teníamos)
- Marcar **Auto Confirm User**

---

## PASO 2 — Despliegue a Vercel (10 min)

1. Sube los cambios a GitHub (`git add . && git commit -m "Auditoría SEO + sistema de leads" && git push`).
2. Ve a https://vercel.com/new
3. Importa el repositorio `limpiezas-astro`
4. En **Environment Variables**, añade:

| Nombre | Valor |
|---|---|
| `PUBLIC_SUPABASE_URL` | `https://gascwpcmwvsgqyjrosiu.supabase.co` |
| `PUBLIC_SUPABASE_ANON_KEY` | `eyJhbGciOiJIUzI1NiIs...` (el del .env) |
| `SUPABASE_SERVICE_ROLE_KEY` | `eyJhbGciOiJIUzI1NiIs...` (el del .env) |
| `BREVO_API_KEY` | (lo añades después en Paso 4) |
| `BREVO_LIST_ID` | (lo añades después en Paso 4) |

5. Click **Deploy**.

6. Cuando termine, ve a **Settings > Domains** y conecta tu dominio `limpiezastorrenueva.com`.

---

## PASO 3 — Google Search Console (5 min)

1. Entra en https://search.google.com/search-console/
2. Añadir propiedad → Dominio → `limpiezastorrenueva.com`
3. Verificar (con registro TXT en DNS o por archivo HTML)
4. Una vez verificado, ir a **Sitemaps** → enviar `sitemap-index.xml`
5. Ir a **URL Inspection** y pedir indexación manual de:
    - https://limpiezastorrenueva.com/
    - https://limpiezastorrenueva.com/zonas/torrevieja
    - https://limpiezastorrenueva.com/zonas/orihuela-costa
    - https://limpiezastorrenueva.com/blog
    - https://limpiezastorrenueva.com/calculadora-presupuesto

---

## PASO 4 — Brevo (15 min) — OPCIONAL pero MUY recomendado

1. Crear cuenta gratis en https://www.brevo.com/ (300 emails/día gratis)
2. **Settings > SMTP & API > Generate API Key**, copiar la key
3. **Contacts > Lists > Create new list** → Nombrarla "Leads web Torrenueva". Copia el ID de lista
4. Ir a Vercel → **Settings > Environment Variables**:
    - `BREVO_API_KEY` = la key copiada
    - `BREVO_LIST_ID` = el ID numérico de la lista
5. Redeploy desde Vercel (Settings → Deployments → 3 puntos → Redeploy)
6. Para enviar emails desde tu propio dominio, configurar SPF y DKIM en DNS (Brevo te da los registros exactos)

---

## PASO 5 — Google Business Profile (1-2 h)

Sigue el documento [`google-business-profile.md`](./google-business-profile.md) completo. Es **el factor más importante** para captación local.

**Mínimos imprescindibles:**
- [ ] Categorías principales y secundarias
- [ ] 9 áreas de servicio
- [ ] 7 servicios listados
- [ ] 10 fotos subidas con naming SEO
- [ ] 20 Q&A sembradas
- [ ] Activar mensajes directos

---

## PASO 6 — Pedir reseñas (continuo)

Empieza HOY a pedir reseñas a clientes actuales con las plantillas del documento GBP. Objetivo: **+10 reseñas el primer mes**.

---

## ✅ Comprobaciones tras despliegue

Visita estas URLs en orden y confirma que cargan correctamente:

- [ ] https://limpiezastorrenueva.com → homepage con testimonios y stats
- [ ] https://limpiezastorrenueva.com/sitemap-index.xml → sitemap generado
- [ ] https://limpiezastorrenueva.com/robots.txt → robots.txt visible
- [ ] https://limpiezastorrenueva.com/maquinas → redirige a /maquinaria
- [ ] https://limpiezastorrenueva.com/zonas/orihuela-costa → página única
- [ ] https://limpiezastorrenueva.com/calculadora-presupuesto → calculadora funcional
- [ ] https://limpiezastorrenueva.com/blog → muestra los 5 artículos seed
- [ ] https://limpiezastorrenueva.com/admin/login → login funciona
- [ ] https://limpiezastorrenueva.com/admin/leads → CRM accesible tras login

Para testear el sistema de leads end-to-end:
1. Entra a `/calculadora-presupuesto`
2. Completa el formulario
3. Comprueba que llega notificación a info@limpiezastorrenueva.com
4. Comprueba que aparece en `/admin/leads`
5. Comprueba que se añade contacto a Brevo (si configuraste API)

---

## 📞 Si algo falla

- **Build falla en Vercel**: revisa los logs y comprueba que las env vars estén exactamente con esos nombres
- **Lead no se guarda**: verifica las políticas RLS de la tabla leads en Supabase
- **Email no llega**: comprueba en Brevo el log de envíos; verifica que el dominio está autenticado con SPF/DKIM
- **Admin no entra**: confirma que el usuario está creado en Supabase Auth y que el email tiene "Auto confirm" marcado
