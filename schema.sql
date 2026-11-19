-- M/S BHARAT TOOLS — Supabase SQL setup
-- Run this in Supabase Dashboard > SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.user_roles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  role text not null default 'customer' check (role in ('customer','admin'))
);
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null check (category in ('Power Tools','Hand Tools','Construction Tools','Hardware','Building Materials')),
  price numeric(12,2) not null default 0 check (price >= 0),
  stock integer not null default 0 check (stock >= 0),
  sku text,
  symbol text default '🔧',
  description text,
  active boolean not null default true,
  created_at timestamptz not null default now()
);
create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete restrict,
  customer_name text,
  items jsonb not null,
  total numeric(12,2) not null check (total >= 0),
  status text not null default 'new' check (status in ('new','confirmed','completed','cancelled')),
  created_at timestamptz not null default now()
);
alter table public.user_roles enable row level security;
alter table public.products enable row level security;
alter table public.orders enable row level security;

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path=public
as $$ select exists(select 1 from public.user_roles where user_id=auth.uid() and role='admin'); $$;

drop policy if exists "Public can read active products" on public.products;
create policy "Public can read active products" on public.products for select using (active = true or public.is_admin());
drop policy if exists "Admins manage products" on public.products;
create policy "Admins manage products" on public.products for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Users can read own role" on public.user_roles;
create policy "Users can read own role" on public.user_roles for select using (user_id=auth.uid() or public.is_admin());
drop policy if exists "Admins manage roles" on public.user_roles;
create policy "Admins manage roles" on public.user_roles for all using (public.is_admin()) with check (public.is_admin());

drop policy if exists "Customers create own orders" on public.orders;
create policy "Customers create own orders" on public.orders for insert with check (user_id=auth.uid());
drop policy if exists "Customers read own orders" on public.orders;
create policy "Customers read own orders" on public.orders for select using (user_id=auth.uid() or public.is_admin());
drop policy if exists "Admins update orders" on public.orders;
create policy "Admins update orders" on public.orders for update using (public.is_admin()) with check (public.is_admin());

-- IMPORTANT: after the first customer signs up, run this with their real auth.users UUID:
-- insert into public.user_roles(user_id, role) values ('USER-UUID-HERE', 'admin')
-- Do not expose your Supabase service_role key in config.js or browser code.
