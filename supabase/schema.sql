create extension if not exists pgcrypto;
create table if not exists public.listings(
id uuid primary key default gen_random_uuid(),
user_id uuid not null references auth.users(id) on delete cascade,
title text not null check(char_length(title) between 3 and 100),
description text not null check(char_length(description) between 5 and 2000),
price numeric(12,2) not null check(price>0),
category text not null check(category in ('Elektronik','Kenderaan','Rumah & Perabot','Fesyen','Sukan','Hobi','Lain-lain')),
location text not null,phone text not null,image_url text not null,
status text not null default 'active' check(status in ('active','sold','hidden')),
created_at timestamptz not null default now());
create index if not exists listings_status_created on public.listings(status,created_at desc);
alter table public.listings enable row level security;
create policy "Read active or own listings" on public.listings for select using(status='active' or auth.uid()=user_id);
create policy "Insert own listings" on public.listings for insert to authenticated with check(auth.uid()=user_id);
create policy "Update own listings" on public.listings for update to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
create policy "Delete own listings" on public.listings for delete to authenticated using(auth.uid()=user_id);
insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types) values('listing-images','listing-images',true,5242880,array['image/jpeg','image/png','image/webp']) on conflict(id) do nothing;
create policy "Read public listing images" on storage.objects for select using(bucket_id='listing-images');
create policy "Upload own listing images" on storage.objects for insert to authenticated with check(bucket_id='listing-images' and (storage.foldername(name))[1]=auth.uid()::text);
create policy "Delete own listing images" on storage.objects for delete to authenticated using(bucket_id='listing-images' and (storage.foldername(name))[1]=auth.uid()::text);