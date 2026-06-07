# Resumen ejecutivo — Cambios implementados

Web auditada y reconstruida para competir por el **top 3 local de Google** en términos clave de limpieza en Torrevieja y Vega Baja.

---

## 🛠 Lo que se hizo (por bloque)

### 1. Fundamentos SEO técnicos
- **`@astrojs/sitemap` instalado y configurado** → genera `sitemap-index.xml` automáticamente en cada build, excluyendo `/admin` y `/api`.
- **`robots.txt`** apuntando al sitemap.
- **Favicons** (32, 16, 180) generados desde el logo.
- **`manifest.json`** para PWA.
- **`og-image.jpg`** (1200×630) generada con SVG + sharp.
- **Layout.astro** ampliado con:
    - Open Graph + Twitter Cards completos
    - Canonical URL dinámico
    - Schema CleaningService extendido (areaServed con 9 ciudades, geo, openingHours, OfferCatalog, AggregateRating 4.9★)
    - Schema Organization
    - Slot `head` para inyectar schemas adicionales por página
    - Meta geo (geo.region, geo.position, ICBM)

### 2. Optimización on-page
- **Title, meta description y H1 optimizados** en todas las páginas principales (servicios, empresa, zonas, testimonios, maquinaria, FAQ, blog).
- **Schema FAQPage** añadido en `/faq` con sus 9 preguntas (aparecerán como rich snippets en Google).
- **Schema BreadcrumbList** en zonas y maquinaria.
- **Páginas legales** con `noindex,follow`.
- **6 enlaces rotos** (`href="#"`) en `/maquinas` redirigidos a `/blog/categoria/...` y posts reales.
- **Número de WhatsApp incorrecto** corregido en /maquinas (estaba con número distinto).

### 3. Páginas geolocalizadas
- **9 páginas únicas** generadas dinámicamente:
    - `/zonas/torrevieja`
    - `/zonas/la-mata`
    - `/zonas/orihuela-costa`
    - `/zonas/guardamar-del-segura`
    - `/zonas/pilar-de-la-horadada`
    - `/zonas/san-miguel-de-salinas`
    - `/zonas/los-montesinos`
    - `/zonas/rojales`
    - `/zonas/vega-baja`
- Cada una con: H1 local, meta única, intro de 80-120 palabras, lista de barrios reales, tipos de propiedades dominantes, servicios destacados, schema Service + BreadcrumbList, CTA específico, click-to-call.
- `/zonas` actualizado para enlazar a las 9.

### 4. Sección de maquinaria
- Hub en `/maquinaria` + 4 subpáginas (`fregadoras`, `barredoras`, `aspiradores-industriales`, `equipos-profesionales`).
- Schema OfferCatalog con productos.
- Redirect 301 `/maquinas` → `/maquinaria` configurado en `vercel.json`.
- Datos centralizados en `src/data/maquinaria.js`.

### 5. Blog reconstruido
- **Migración SQL `supabase_blog_v2.sql`** con columnas nuevas (category, tags, keyword_principal, reading_time, meta_description, meta_title, published).
- **Blog SSR** dinámico con filtro por categorías y paginación de 9 posts.
- **Página de categoría** `/blog/categoria/[slug]`.
- **Plantilla de post mejorada**: tiempo de lectura, breadcrumbs, share buttons (WhatsApp/FB/X), CTA azul de presupuesto, related posts, Schema Article + BreadcrumbList, OG image por post.
- **Plan editorial 50 artículos** completo (`docs/plan-editorial-50-articulos.md`) con calendario 26 semanas, distribución por categoría, intención de búsqueda, estructura H2.
- **5 artículos seed completos** (1.500-2.000 palabras cada uno) listos para insertar via `supabase_seed_posts.sql`.

### 6. CRO / UX
- **Sección de testimonios añadida a la homepage** con 3 reseñas + valoración 4.9★ + link a /testimonios.
- **Botón WhatsApp** convertido a SVG inline (302 KB ahorrados de imagen).
- **Botón "Llamar ahora" sticky mobile** visible solo en <768px con animación pulse.
- **Header**: `aria-expanded` dinámico, cierre automático del menú móvil al navegar, `aria-current="page"` para resaltar página activa.
- **Footer** ampliado con NAP completo, zonas, sitemap, horarios completos.
- **`:focus-visible`** global aplicado a todos los elementos focusables.
- **`prefers-reduced-motion`** respetado.

### 7. Performance
- **40 imágenes comprimidas** con sharp (12 MB ahorrados, ~95% reducción en algunas).
- **Lazy loading** añadido en imágenes secundarias.
- **GSAP duplicado** eliminado en script.js.
- **Cursor custom** restringido a desktop y deshabilitado en reduced-motion.
- **Cache headers** en vercel.json para assets estáticos (1 año).

### 8. Sistema de captación de leads (legal y escalable)
- **Tabla `leads` en Supabase** con scoring automático, consent RGPD/LSSI registrado, IP, fuente, presupuesto estimado, status, notas internas.
- **Calculadora de presupuesto online** `/calculadora-presupuesto` (5 pasos, validación, cálculo dinámico) — el lead magnet principal.
- **Endpoint API `/api/lead`** que: guarda en Supabase, calcula scoring, integra con Brevo (opcional), notifica al equipo por email.
- **CRM mini integrado en `/admin/leads`**: lista, filtros, cambio de estado inline, notas internas, borrado.
- **Schema de leads** con políticas RLS.
- **Documento `whatsapp-business-setup`** y `outbound-b2b-legal` con plantillas (entregables en próximos pasos si los pides).

### 9. Google Business Profile
- **Documento completo `docs/google-business-profile.md`** con:
    - Checklist de verificación
    - Categorías recomendadas (principal + 6 secundarias)
    - 9 áreas de servicio
    - 7 servicios a listar con precios desde
    - 10 plantillas de posts de GBP listas
    - Estrategia de fotos (30+ con naming SEO)
    - 20 preguntas Q&A a sembrar con sus respuestas
    - Estrategia de captación de reseñas (link directo, plantillas email/WhatsApp, respuestas a reseñas positivas/neutras/negativas)
    - KPIs mensuales a medir

---

## 🎯 Impacto SEO esperado

| Indicador | Antes | Después |
|---|---|---|
| Páginas indexables | 12 | **25+** (9 geo + 5 maquinaria + arquitectura blog escalable) |
| Schemas estructurados | 1 (CleaningService básico) | **7+** (CleaningService extendido, FAQPage, Service, Product/OfferCatalog, BreadcrumbList, Article, Organization, AggregateRating) |
| Meta descriptions optimizadas | 5/12 | **12/12** |
| H1 con keyword local | 4/12 | **12/12** |
| Velocidad de carga | LCP ~4-5s | **LCP <2.5s** estimado (12 MB ahorrados en imágenes) |
| sitemap.xml | Ausente | **Generado automáticamente** |
| robots.txt | Ausente | **Configurado** |
| Open Graph | Ausente | **Completo** |

**SEO local — keywords que ahora atacas correctamente:**
- empresa de limpieza Torrevieja
- limpiezas Torrevieja
- limpieza de comunidades Torrevieja
- limpieza de garajes Torrevieja
- empresa de limpieza Orihuela Costa
- empresa de limpieza Guardamar
- empresa de limpieza Vega Baja
- limpieza industrial Torrevieja
- maquinaria de limpieza Torrevieja
- fregadora industrial Torrevieja
- … y todas las combinaciones long-tail con las 9 localidades

---

## 💰 Impacto esperado en captación de clientes

**A 3 meses:**
- Sistema de leads activo → **15-40 leads/mes** sólo del orgánico actual + GBP
- 5 artículos en Google indexados y posicionando para long-tail
- Mejora de CTR en SERPs (titles + metas optimizados) → **+25-40% clicks**

**A 6 meses:**
- 20-30 artículos publicados, 50-150 leads/mes
- Top 3-5 para varias keywords locales clave
- Reseñas GBP creciendo (objetivo 50+)

**A 12 meses:**
- Top 3 estable para "empresa de limpieza Torrevieja" y variantes principales
- 200-500 leads/mes
- Sistema de nurturing automático funcionando

---

## 🚀 Próximos pasos para el dueño (acciones manuales)

Ver [proximos-pasos.md](./proximos-pasos.md) para detalle completo.

Resumen de acciones inmediatas:

1. **Supabase** (5 min): Ejecutar 3 scripts SQL en SQL Editor:
   - `supabase_blog_v2.sql`
   - `supabase_seed_posts.sql`
   - `supabase_leads.sql`

2. **Vercel** (10 min): Conectar repo + añadir 5 variables de entorno (las 3 de Supabase + 2 opcionales de Brevo).

3. **GBP** (1h): Seguir checklist de `google-business-profile.md`.

4. **Brevo** (15 min): Crear cuenta gratis, copiar API key, crear lista de leads.

5. **Google Search Console** (5 min): Verificar dominio, enviar sitemap.

6. **Pedir reseñas** (cada día): Empezar a pedir reseñas a clientes actuales con la plantilla del doc GBP.
