# Memulai Salla Raed

Panduan ini membantu Anda menyiapkan starter theme Raed untuk belajar membuat theme Salla. Penjelasan menggunakan Bahasa Indonesia; nama file dan perintah mengikuti tooling aslinya.

## 1. Mengenal Raed

**Raed** adalah starter theme resmi Salla. **Twilight** adalah engine theme Salla, sedangkan **Twig** adalah bahasa template yang digunakan Raed.

Untuk developer Magento, pendekatan awalnya adalah mempelajari lapisan tampilan storefront: layout, template halaman, komponen, JavaScript, styling, dan konfigurasi merchant. Data serta layanan toko berasal dari platform Salla. Preview theme menggunakan demo store Salla.

Referensi:

- [Repository dan README resmi Raed](https://github.com/SallaApp/theme-raed)
- [Panduan pengembangan theme Salla](https://docs.salla.dev/421878m0)

## 2. Kondisi workspace saat panduan dibuat

Pemeriksaan pada 11 Oktober 2026:

| Item | Hasil pemeriksaan |
| --- | --- |
| Workspace | `/workspace/themes` |
| Folder tujuan | `/workspace/themes/nura-raed`, masih kosong |
| Node.js | `24.21.0` |
| npm | `11.19.0` |
| Salla CLI | `3.2.62` |
| Git | `2.43.0` |
| pnpm | Belum ditemukan pada PATH |

`package.json` upstream Raed yang diperiksa memiliki versi `1.358.0`, mewajibkan pnpm melalui `preinstall`, dan menetapkan Node `^22.18.0 || >=24.11.0`. Node pada environment ini memenuhi rentang tersebut. Versi theme yang nantinya Anda ambil perlu diperiksa lagi di repository lokal.

Referensi: [package.json resmi Raed](https://github.com/SallaApp/theme-raed/blob/master/package.json).

## 3. Siapkan akun dan demo store

Anda membutuhkan:

1. Akun [Salla Partners](https://salla.partners).
2. Akun [GitHub](https://github.com).
3. Koneksi GitHub dengan akun Salla Partners melalui proses otorisasi yang disediakan Salla.
4. Demo store untuk mencoba theme.

Referensi:

- [Membuat dan mengimpor theme melalui Salla Partners](https://docs.salla.dev/421877m0)
- [Menyiapkan theme dan demo preview](https://docs.salla.dev/421879m0)

## 4. Buat repository dari template Raed

Gunakan alur ini agar kode lokal berasal dari repository milik Anda yang terhubung ke Salla Partners.

1. Buka [SallaApp/theme-raed](https://github.com/SallaApp/theme-raed).
2. Pilih **Use this template → Create a new repository**.
3. Buat repository bernama `nura-raed` pada akun GitHub Anda.
4. Masuk ke Salla Partners, lalu buka **My Themes**.
5. Hubungkan GitHub jika belum terhubung.
6. Pilih **Import Theme**, lalu pilih repository `nura-raed` milik Anda.
7. Lengkapi informasi theme yang diminta portal.

Selesai ketika repository Anda berisi source Raed dan theme tercatat di Salla Partners.

Referensi:

- [Panduan Create Theme: penggunaan template Raed dan import](https://docs.salla.dev/422775m0)
- [Panduan Import an existing theme melalui portal](https://docs.salla.dev/421877m0)

## 5. Clone ke folder lokal

Buka terminal container. Ganti `USERNAME` dengan nama akun GitHub Anda:

```bash
cd /workspace/themes/nura-raed
git clone https://github.com/USERNAME/nura-raed.git .
```

Tanda `.` berarti kode ditempatkan langsung di folder saat ini. Perintah ini menggunakan folder kosong yang sudah Anda buat. Jika folder sudah berisi file, periksa isinya terlebih dahulu; jangan menghapus file untuk memaksa cloning.

Untuk repository private, selesaikan autentikasi GitHub melalui mekanisme Git yang tersedia di environment Anda.

Periksa hasilnya:

```bash
pwd
ls -la
cat package.json
```

Selesai ketika `README.md`, `package.json`, `twilight.json`, dan direktori `src` tersedia di root theme.

Referensi: [Workflow development: clone repository theme ke environment lokal](https://docs.salla.dev/421878m0).

## 6. Pasang dependensi

Pada upstream yang diperiksa, Raed menggunakan pnpm. Jika pnpm belum tersedia:

```bash
npm install -g pnpm
pnpm --version
```

Kemudian, dari root theme:

```bash
cd /workspace/themes/nura-raed
pnpm install
```

Panduan umum Salla menyebut `npm install`, tetapi upstream Raed yang diperiksa memiliki script `preinstall: npx only-allow pnpm`. Ikuti `package.json`, lockfile, dan instruksi repository lokal. Jika checkout Anda menetapkan versi package manager tertentu, gunakan versi tersebut.

Selesai ketika pemasangan dependensi berhasil tanpa error. Jika gagal, catat pesan error serta versi Node dan pnpm sebelum mencoba perbaikan.

Referensi:

- [Konfigurasi dependensi, package manager, dan Node Raed](https://github.com/SallaApp/theme-raed/blob/master/package.json)
- [Lockfile pnpm Raed](https://github.com/SallaApp/theme-raed/blob/master/pnpm-lock.yaml)

## 7. Login dan jalankan preview

Salla CLI sudah terpasang di environment yang diperiksa. Dari root theme:

```bash
salla login
salla theme preview --with-editor
```

Ikuti proses login di browser dan pilih demo store saat diminta. Opsi `--with-editor` membuka preview dengan editor konfigurasi theme.

Preview mengawasi perubahan file dan memperbarui halaman yang ditampilkan. Gunakan URL dan instruksi yang dikeluarkan CLI. Pada dev container, buka tautan dari browser host sesuai petunjuk CLI; jangan menganggap preview selalu menggunakan port `3000` atau `5173`.

Untuk melihat opsi pada versi CLI yang Anda gunakan:

```bash
salla theme preview --help
```

Untuk menghentikan preview, tekan `Ctrl+C` pada terminal yang menjalankannya.

Selesai ketika demo store menampilkan theme Anda dan editor theme dapat dibuka. Preview memerlukan koneksi internet dan akses akun/demo store; build lokal saja belum membuktikan preview berhasil.

Referensi: [Panduan resmi Theme Preview](https://docs.salla.dev/422776m0).

## 8. Periksa build production

Pada upstream yang diperiksa, script build production bernama `production`:

```bash
pnpm run production
```

Script tersebut menjalankan `webpack --mode production`. Script lain yang tersedia adalah `development`, `watch`, dan alias `prod`. Periksa `package.json` lokal sebelum menggunakannya; jangan mengasumsikan ada script `build` atau `dev`.

Build production tidak mempublikasikan theme. Selesai ketika perintah berakhir sukses tanpa error. Tampilan storefront tetap perlu diperiksa melalui preview.

Referensi: [Scripts build Raed](https://github.com/SallaApp/theme-raed/blob/master/package.json).

## 9. Alternatif: membuat theme melalui CLI

Selain alur template GitHub dan import portal di atas, Salla menyediakan pembuatan theme melalui CLI:

```bash
cd /workspace/themes
salla login
salla theme create --type twig --name nura-raed
```

Opsi `--type twig` dan `--name` tersedia pada Salla CLI `3.2.62` yang diperiksa. Ikuti prompt yang muncul, termasuk otorisasi GitHub dan detail theme. Karena folder `nura-raed` sudah ada, alur template dan cloning ke folder kosong pada langkah 4–5 lebih mudah dikontrol untuk workspace ini. Jangan menjalankan kedua alur untuk membuat theme yang sama.

Periksa pilihan versi CLI Anda dengan:

```bash
salla theme create --help
```

Referensi:

- [Create Theme melalui Salla CLI](https://docs.salla.dev/422775m0)
- [Autentikasi dan gambaran perintah theme](https://docs.salla.dev/422774m0)

## 10. Mulai membaca kode setelah setup

Baca dalam urutan berikut, sambil memastikan path tersebut ada pada checkout Anda:

| File atau direktori | Yang dipelajari |
| --- | --- |
| `README.md` | Petunjuk starter dan workflow |
| `package.json` | Dependensi, batas versi Node, dan scripts |
| `twilight.json` | Metadata, fitur, settings, dan komponen merchant |
| `webpack.config.js` | Pengolahan assets dan integrasi watcher |
| `src/views/layouts/master.twig` | Layout bersama dan blok halaman |
| `src/views/pages/index.twig` | Titik masuk halaman homepage |
| `src/views/components/home/` | Komponen yang digunakan homepage |
| `src/assets/` | JavaScript, styling, dan images |
| `src/locales/` | Teks terjemahan |

Referensi:

- [Struktur direktori pada README Raed](https://github.com/SallaApp/theme-raed#directory-structure)
- [Konfigurasi theme melalui twilight.json dan portal](https://docs.salla.dev/421879m0)
- [Kontrak render homepage dan komponen Salla](https://docs.salla.dev/422558m0)
- [Master layout Raed](https://github.com/SallaApp/theme-raed/blob/master/src/views/layouts/master.twig)

**Langkah pertama Anda:** buat repository `nura-raed` dari template resmi dan hubungkan ke Salla Partners, lalu clone ke folder lokal. Setelah source tersedia, spesifikasi belajar “Belajar Dasar Raed” dapat disusun berdasarkan kode yang benar-benar Anda gunakan.

Panduan ini merupakan dokumentasi get started, bukan laporan instalasi yang sudah dijalankan atau spesifikasi milestone. Cloning, pemasangan dependensi, login, preview, dan build belum dijalankan saat penulisan.
