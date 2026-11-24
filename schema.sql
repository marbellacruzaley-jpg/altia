-- ALTIA · tabla única para proyectos, clientes, movimientos, eventos y tareas
create table if not exists public.registros (
  col text not null check (col in ('proyectos','clientes','movimientos','eventos','tareas')),
  id text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid default auth.uid(),
  primary key (col, id)
);
alter table public.registros enable row level security;
revoke all on public.registros from anon;
grant select, insert, update, delete on public.registros to authenticated;
drop policy if exists "equipo lee" on public.registros;
drop policy if exists "equipo inserta" on public.registros;
drop policy if exists "equipo actualiza" on public.registros;
drop policy if exists "equipo borra" on public.registros;
create policy "equipo lee" on public.registros for select to authenticated using (true);
create policy "equipo inserta" on public.registros for insert to authenticated with check (true);
create policy "equipo actualiza" on public.registros for update to authenticated using (true) with check (true);
create policy "equipo borra" on public.registros for delete to authenticated using (true);
alter publication supabase_realtime add table public.registros;
