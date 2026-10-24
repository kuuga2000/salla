# Dev Container Salla Theme — Ubuntu ringan

Paket ini berisi environment pengembangan, belum berisi theme Raed.

## Isi

- Ubuntu 24.04 LTS dari image dasar tanpa desktop.
- Node.js 22, npm, Salla CLI, Git, curl, Vim, dan SSH client.
- User `ubuntu` (bukan root).
- Home disimpan di Docker volume agar konfigurasi CLI dan cache npm bertahan.
- VS Code Dev Containers dan Docker Compose menggunakan konfigurasi yang sama.

Node disalin dari image resmi Node ke Ubuntu. PHP/Composer, database, Java,
tidak dipasang karena fokus paket ini adalah theme Salla. Firefox dipasang dari
[repository DEB resmi Mozilla](https://support.mozilla.org/en-US/kb/install-firefox-linux)
dan `BROWSER=firefox` diatur untuk CLI serta terminal VS Code.
Dependensi build tambahan dapat ditambahkan jika theme yang dipilih memerlukannya.
Node 22 dipilih sebagai baseline; cek `engines` dalam package.json theme nanti.

## Mulai di Windows + WSL

1. Aktifkan Docker Desktop WSL integration untuk distro Ubuntu Anda.
2. Ekstrak paket di filesystem WSL, misalnya `~/projects/salla-theme`, agar
   pemasangan npm dan file watcher tidak bergantung pada filesystem `/mnt/c`.
3. Buka folder hasil ekstraksi yang berisi `compose.yaml` dengan VS Code dari WSL:

   ```bash
   cd ~/projects/salla-theme
   code .
   ```

4. Pasang extension **Dev Containers** di VS Code.
5. Command Palette → **Dev Containers: Reopen in Container**.
6. Tunggu build dan pemeriksaan versi selesai.

## Buat atau impor theme

Di terminal container:

```bash
salla login
salla theme create
```

Ikuti instruksi CLI dan hubungkan akun Salla Partners dengan GitHub.
Jika CLI menampilkan URL login, buka URL tersebut di browser Windows.
Untuk membuka login dengan Firefox di container, jalankan **Dev Containers:
Rebuild Container** setelah perubahan konfigurasi, lalu buka terminal baru:

```bash
echo "$BROWSER"
firefox --version
salla login
```

Firefox membutuhkan koneksi display GUI (misalnya X11/WSLg) agar jendelanya
terlihat. Pada Compose tanpa VS Code, teruskan display/socket dari host bila
ingin memakai Firefox di container.
Pilih starter yang tersedia untuk mempelajari Raed atau impor repository theme Anda.
Masuk ke folder theme yang dibuat CLI, lalu:

```bash
cd nama-folder-theme
npm install
salla theme preview
```

Ganti `nama-folder-theme` dengan nama sebenarnya. Jika CLI telah memasang
dependensi dan menjalankan preview, langkah terakhir tidak perlu diulang.
Untuk repository dengan package-lock.json yang sudah sinkron, gunakan `npm ci`.
Gunakan package manager yang ditetapkan repository jika berbeda.

Setup otomatis hanya memasang dependensi jika package.json berada di root
workspace. Untuk theme di subfolder, jalankan npm dari subfolder tersebut.
Preview Salla tetap membutuhkan koneksi internet serta akun/demo store;
container ini bukan pengganti backend Salla.

## Pakai Docker Compose tanpa VS Code

Dari root folder paket:

```bash
docker compose up -d --build
docker compose exec salla bash
bash .devcontainer/setup.sh
```

Matikan dari terminal host:

```bash
docker compose down
```

Volume home tetap tersimpan. `docker compose down -v` menghapus volume home
beserta konfigurasi/login yang tersimpan di dalamnya.

Compose biasa memakai UID/GID 1000 dari image Ubuntu. Jika user WSL berbeda,
gunakan Dev Containers (menyesuaikan UID otomatis), atau sesuaikan user image
agar workspace bisa ditulis. Jangan menjalankan npm sebagai root.

## Port dan file watcher

Port 3000 dan 5173 disediakan untuk dev server opsional, bukan jaminan port CLI.
Ikuti URL/port yang ditampilkan Salla CLI. Untuk server lokal yang akan dibuka
melalui port Docker, atur server agar bind ke `0.0.0.0` sesuai opsi server itu.
Untuk port lain, tambahkan mapping Compose dan buat ulang container.

## Versi dan rebuild

Default memakai rilis stabil CLI dari tag npm `latest`, bukan beta.
Untuk pin versi yang telah berhasil Anda uji, jalankan dari host:

```bash
SALLA_CLI_VERSION=VERSI_YANG_SUDAH_DIUJI docker compose build --no-cache
docker compose up -d
```

Ganti placeholder versi dengan versi sebenarnya. Node memakai tag major 22
dan Ubuntu tag 24.04; patch image dapat berubah saat build berikutnya.
Untuk refresh CLI/image default:

```bash
docker compose build --pull --no-cache
docker compose up -d
```

## Validasi

Konfigurasi JSON/YAML, referensi path, dan sintaks shell telah diperiksa.
Build Docker, login, serta preview Salla belum dijalankan di lingkungan pembuat
paket karena Docker tidak tersedia. Setelah build lokal, cek:

```bash
cat /etc/os-release
node --version
npm --version
salla --version
```

Referensi:
- https://github.com/SallaApp/Salla-CLI
- https://docs.salla.dev/429774m0
- https://docs.salla.dev/421878m0
- https://nodejs.org/en/about/previous-releases
