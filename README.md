# Khairu Market — MVP V1
Marketplace Malaysia untuk jual beli pelbagai barangan, website React + Android melalui Capacitor.

## Fungsi
- Carian dan kategori produk
- Halaman maklumat produk, kegemaran, WhatsApp penjual
- Akaun e-mel melalui Supabase Auth
- Muat naik gambar dan iklan ke Supabase Storage/Postgres
- Mod demo tanpa Supabase

## Jalankan website
1. Pasang Node.js 20+
2. Jalankan `npm install` dan `npm run dev`
3. Untuk backend, cipta projek Supabase dan jalankan `supabase/schema.sql` dalam SQL Editor
4. Salin `.env.example` kepada `.env` dan isi URL projek serta **anon/publishable key** (bukan service-role key)
5. Jalankan `npm run build` untuk fail produksi dalam `dist/`

## Android
Jalankan `npm run build`, `npx cap add android`, `npx cap sync android`, dan `npx cap open android`. Bina APK dalam Android Studio. Projek Android native dijana secara tempatan dan tidak disertakan dalam repo ini.

## Status
Ini kod MVP yang belum diuji end-to-end, belum mempunyai APK, belum disambungkan ke Supabase, dan belum diterbitkan. Sebelum pelancaran awam, tambah moderasi, polisi privasi, pengesahan telefon, perlindungan spam dan semakan keselamatan.
