-- ===================================================================
-- Limpiezas Torrenueva - Tabla de leads (CRM)
-- Ejecutar en SQL Editor de Supabase
-- ===================================================================

create table if not exists leads (
    id uuid default gen_random_uuid() primary key,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    updated_at timestamp with time zone default timezone('utc'::text, now()) not null,

    -- Datos del lead
    nombre text,
    email text,
    telefono text,

    -- Datos del proyecto
    tipo_propiedad text, -- comunidad/oficina/garaje/industrial/otro
    localidad text,
    m2 int,
    frecuencia text,    -- diaria/semanal/quincenal/mensual/puntual
    servicios_extra text[], -- array

    -- Origen y cualificación
    fuente text not null, -- calculadora/guia/contacto/whatsapp/otro
    presupuesto_estimado_min int,
    presupuesto_estimado_max int,
    score_cualificacion int default 0,
    mensaje text,

    -- Consentimientos RGPD/LSSI
    consent_rgpd boolean default false,
    consent_marketing boolean default false,
    consent_ip text,

    -- Gestión CRM
    status text default 'nuevo', -- nuevo/contactado/presupuesto_enviado/cliente/perdido
    notas text,
    asignado_a text
);

-- Índices
create index if not exists idx_leads_status on leads(status, created_at desc);
create index if not exists idx_leads_fuente on leads(fuente);
create index if not exists idx_leads_email on leads(email);

-- Trigger updated_at
create or replace function update_leads_updated_at()
returns trigger as $$
begin
    new.updated_at = timezone('utc'::text, now());
    return new;
end;
$$ language plpgsql;

drop trigger if exists update_leads_updated_at on leads;
create trigger update_leads_updated_at
    before update on leads
    for each row execute function update_leads_updated_at();

-- RLS: solo escritura anónima (desde la web), solo admin lee
alter table leads enable row level security;

drop policy if exists "Allow anonymous lead insert" on leads;
create policy "Allow anonymous lead insert" on leads
    for insert with check (true);

drop policy if exists "Authenticated read all leads" on leads;
create policy "Authenticated read all leads" on leads
    for select using (auth.role() = 'authenticated');

drop policy if exists "Authenticated update leads" on leads;
create policy "Authenticated update leads" on leads
    for update using (auth.role() = 'authenticated');

drop policy if exists "Authenticated delete leads" on leads;
create policy "Authenticated delete leads" on leads
    for delete using (auth.role() = 'authenticated');
