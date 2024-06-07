# restAPI-postgresql
Tugas Teknologi Basis Data, Semester 4

### Penjelasan Lengkap: Berkas `package.json` untuk Proyek `restapi_crud_grb`

Berkas `package.json` adalah inti dari proyek Node.js yang mendefinisikan berbagai informasi dan konfigurasi yang diperlukan untuk menjalankan proyek. Berikut ini adalah penjelasan detail dari setiap bagian yang ada di dalam `package.json` untuk proyek `restapi_crud_grb`.

#### **1. Informasi Umum Proyek**
```json
{
  "name": "restapi_crud_grb",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "@prisma/client": "^5.15.0",
    "cors": "^2.8.5",
    "dotenv": "^16.4.5",
    "express": "^4.19.2",
    "pg": "^8.12.0",
    "prisma": "^5.15.0"
  },
  "devDependencies": {
    "nodemon": "^3.1.3"
  }
}
```

#### **2. Penjelasan Detail Bagian-bagian `package.json`**

**Nama dan Versi Proyek**
- **`"name": "restapi_crud_grb"`**: Menetapkan nama proyek. `restapi_crud_grb` merupakan singkatan dari "REST API CRUD for Good Reading Bookstore".
- **`"version": "1.0.0"`**: Menetapkan versi proyek, mengikuti standar SemVer (Semantic Versioning). Versi ini menunjukkan bahwa proyek ini adalah rilis pertama.

**Deskripsi Proyek**
- **`"description": ""`**: Tempat untuk deskripsi singkat tentang proyek. Saat ini masih kosong dan bisa diisi dengan penjelasan mengenai proyek ini, misalnya "REST API untuk manajemen buku di Good Reading Bookstore".

**Entry Point Proyek**
- **`"main": "src/index.js"`**: Menentukan berkas utama yang akan dijalankan ketika proyek ini diimpor sebagai modul. `src/index.js` biasanya merupakan titik masuk utama aplikasi.

**Scripts**
- **`"scripts": { "test": "echo \"Error: no test specified\" && exit 1" }`**: Menyediakan skrip yang bisa dijalankan menggunakan `npm run`. Skrip `test` ini saat ini hanya memberikan pesan error karena belum ada pengujian yang ditentukan. Anda bisa menambahkan skrip lainnya seperti `start`, `dev`, dll.

**Informasi Penulis dan Lisensi**
- **`"author": ""`**: Bagian ini biasanya berisi nama penulis atau pemilik proyek. Saat ini masih kosong.
- **`"license": "ISC"`**: Menentukan lisensi proyek ini. "ISC" adalah salah satu jenis lisensi open source yang umum digunakan.

#### **3. Dependencies**
Dependencies adalah paket-paket yang diperlukan untuk menjalankan aplikasi ini. Mereka akan diinstal ketika Anda menjalankan `npm install`.

- **`"@prisma/client": "^5.15.0"`**: Klien Prisma untuk mengakses basis data. Versi ini adalah versi yang disarankan oleh Prisma.
- **`"cors": "^2.8.5"`**: Middleware untuk mengizinkan Cross-Origin Resource Sharing. Digunakan untuk mengizinkan aplikasi web dari domain lain untuk berkomunikasi dengan server ini.
- **`"dotenv": "^16.4.5"`**: Memungkinkan kita untuk memuat variabel lingkungan dari berkas `.env` ke dalam `process.env`, membantu dalam mengelola konfigurasi dengan mudah.
- **`"express": "^4.19.2"`**: Framework web minimalis untuk Node.js, digunakan untuk membuat server HTTP dan API.
- **`"pg": "^8.12.0"`**: Driver untuk PostgreSQL, memungkinkan aplikasi Node.js untuk berkomunikasi dengan database PostgreSQL.
- **`"prisma": "^5.15.0"`**: ORM (Object-Relational Mapping) untuk Node.js yang membantu dalam pengelolaan basis data secara programatik. Prisma mempermudah query dan migrasi database.

#### **4. DevDependencies**
DevDependencies adalah paket-paket yang hanya diperlukan selama pengembangan aplikasi. Mereka akan diinstal ketika Anda menjalankan `npm install` di mode pengembangan.

- **`"nodemon": "^3.1.3"`**: Alat pengembangan yang secara otomatis memulai ulang aplikasi Node.js ketika perubahan pada berkas terdeteksi. Ini membantu dalam mempercepat proses pengembangan dengan menghindari restart manual.

### Struktur Proyek
- **`src/index.js`**: Berkas entry point aplikasi yang biasanya menginisialisasi server dan mengatur middleware.
- **`books.controller.js`**: Mengelola rute dan logika untuk entitas buku.
- **`customers.controller.js`**: Mengelola rute dan logika untuk entitas pelanggan.
- **`promotions.controller.js`**: Mengelola rute dan logika untuk entitas promosi.
- **`reviews.controller.js`**: Mengelola rute dan logika untuk entitas ulasan.
- **`wishlists.controller.js`**: Mengelola rute dan logika untuk entitas wishlist.

### Kesimpulan
Berkas `package.json` ini adalah konfigurasi yang lengkap untuk proyek `restapi_crud_grb`. Ini mendefinisikan semua dependensi yang diperlukan untuk menjalankan proyek dan beberapa devDependencies untuk memperlancar proses pengembangan. Dengan konfigurasi ini, pengembang dapat dengan mudah menginstal semua paket yang diperlukan dan memastikan proyek dapat berjalan dengan baik di berbagai lingkungan.
