
-- Tabla de Posts (si no existe)
create table if not exists posts (
  id uuid default uuid_generate_v4() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  title text not null,
  slug text unique not null,
  content text,
  description text,
  tag text,
  image_url text
);

-- Habilitar seguridad (RLS)
alter table posts enable row level security;

-- POLÍTICAS DE SEGURIDAD

-- 1. Todo el mundo puede VER los posts (público)
drop policy if exists "Public posts are viewable by everyone." on posts;
create policy "Public posts are viewable by everyone." on posts for select using ( true );

-- 2. SOLO TU USUARIO puede CREAR posts
drop policy if exists "Only Admin can insert" on posts;
create policy "Only Admin can insert" on posts for insert
with check ( auth.uid() = 'bee13c93-fa96-45e6-9be4-51cdac0d62a7' );

-- 3. SOLO TU USUARIO puede EDITAR posts
drop policy if exists "Only Admin can update" on posts;
create policy "Only Admin can update" on posts for update
using ( auth.uid() = 'bee13c93-fa96-45e6-9be4-51cdac0d62a7' );

-- 4. SOLO TU USUARIO puede BORRAR posts
drop policy if exists "Only Admin can delete" on posts;
create policy "Only Admin can delete" on posts for delete
using ( auth.uid() = 'bee13c93-fa96-45e6-9be4-51cdac0d62a7' );

-- Datos de ejemplo (impidiendo duplicados con ON CONFLICT si existiera constraint, o simple insert)
-- Nota: Si ya insertaste los datos antes, esto podría duplicarlos. Mejor ejecutar solo las políticas.
