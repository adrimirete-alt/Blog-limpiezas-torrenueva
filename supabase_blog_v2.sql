-- ===================================================================
-- Limpiezas Torrenueva - Migración blog v2
-- Añade categorías, tags, SEO metadata, tiempo lectura
-- Ejecutar en SQL Editor de Supabase
-- ===================================================================

-- 1) Asegurar que la tabla posts existe
create table if not exists posts (
    id uuid default gen_random_uuid() primary key,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    title text not null,
    slug text unique not null,
    content text,
    description text,
    tag text,
    image_url text
);

-- 2) Añadir columnas nuevas
alter table posts add column if not exists category text;
alter table posts add column if not exists tags text[] default '{}';
alter table posts add column if not exists keyword_principal text;
alter table posts add column if not exists reading_time int default 5;
alter table posts add column if not exists meta_description text;
alter table posts add column if not exists meta_title text;
alter table posts add column if not exists published boolean default true;
alter table posts add column if not exists updated_at timestamp with time zone default timezone('utc'::text, now());

-- 3) Crear índice para búsquedas por categoría
create index if not exists idx_posts_category on posts(category) where published = true;
create index if not exists idx_posts_published on posts(published, created_at desc);

-- 4) Trigger para actualizar updated_at automáticamente
create or replace function update_updated_at_column()
returns trigger as $$
begin
    new.updated_at = timezone('utc'::text, now());
    return new;
end;
$$ language plpgsql;

drop trigger if exists update_posts_updated_at on posts;
create trigger update_posts_updated_at
    before update on posts
    for each row execute function update_updated_at_column();

-- 5) Políticas RLS (públicas para SELECT, sólo admin para escritura)
alter table posts enable row level security;

drop policy if exists "Public posts are viewable by everyone." on posts;
create policy "Public posts are viewable by everyone." on posts
    for select using (published = true);

drop policy if exists "Authenticated users can insert posts" on posts;
create policy "Authenticated users can insert posts" on posts
    for insert with check (auth.role() = 'authenticated');

drop policy if exists "Authenticated users can update posts" on posts;
create policy "Authenticated users can update posts" on posts
    for update using (auth.role() = 'authenticated');

drop policy if exists "Authenticated users can delete posts" on posts;
create policy "Authenticated users can delete posts" on posts
    for delete using (auth.role() = 'authenticated');

-- 6) Categorías predefinidas (opcional, para referencia)
-- Categorías sugeridas:
--   - 'comunidades' - Limpieza de Comunidades
--   - 'garajes' - Limpieza de Garajes
--   - 'oficinas' - Limpieza de Oficinas
--   - 'industrial' - Limpieza Industrial
--   - 'maquinaria' - Maquinaria
--   - 'zonas' - Zonas geográficas
--   - 'consejos' - Consejos prácticos
