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

### Penjelasan Dependencies dan Endpoints

#### **3. Dependencies yang Digunakan**

1. **`@prisma/client` (Versi: ^5.15.0) (tidak jadi digunakan)**
   - **Fungsi**: Klien Prisma digunakan untuk berinteraksi dengan database. Ini memungkinkan aplikasi untuk melakukan operasi database dengan lebih mudah menggunakan ORM (Object-Relational Mapping).
   - **Kegunaan**: Memudahkan pengelolaan dan interaksi dengan database, seperti melakukan query, insert, update, dan delete data tanpa perlu menulis SQL secara manual.

2. **`cors` (Versi: ^2.8.5)**
   - **Fungsi**: Middleware untuk mengaktifkan Cross-Origin Resource Sharing (CORS).
   - **Kegunaan**: Memungkinkan aplikasi web dari domain yang berbeda untuk berkomunikasi dengan server ini, penting untuk aplikasi yang membutuhkan akses lintas domain.

3. **`dotenv` (Versi: ^16.4.5)**
   - **Fungsi**: Memungkinkan pemuatan variabel lingkungan dari berkas `.env` ke dalam `process.env`.
   - **Kegunaan**: Menyediakan cara untuk mengelola konfigurasi aplikasi seperti koneksi database dan port server dengan cara yang aman dan mudah diakses.

4. **`express` (Versi: ^4.19.2)**
   - **Fungsi**: Framework web minimalis untuk Node.js.
   - **Kegunaan**: Digunakan untuk membangun server HTTP dan API dengan cepat dan efisien. Mempermudah pengelolaan routing dan middleware.

5. **`pg` (Versi: ^8.12.0)**
   - **Fungsi**: Driver untuk PostgreSQL.
   - **Kegunaan**: Memungkinkan aplikasi Node.js untuk berkomunikasi dengan database PostgreSQL, melakukan query, dan mengelola data.

6. **`prisma` (Versi: ^5.15.0)(tidak jadi digunakan)**
   - **Fungsi**: Alat ORM untuk Node.js yang membantu dalam pengelolaan basis data.
   - **Kegunaan**: Mempermudah pembuatan model data, migrasi database, dan eksekusi query dengan cara yang lebih terstruktur dan aman dibandingkan dengan penulisan SQL manual.

7. **`nodemon` (Versi: ^3.1.3)**
   - **Fungsi**: Alat pengembangan yang memantau perubahan pada berkas dan secara otomatis me-restart server.
   - **Kegunaan**: Membantu mempercepat pengembangan dengan meminimalisir kebutuhan untuk me-restart server secara manual setiap kali ada perubahan pada kode.

#### **4. Endpoints yang Diinisialisasikan**

Dalam proyek ini, ada beberapa endpoint yang diinisialisasikan untuk mengelola berbagai entitas seperti buku, pelanggan, promosi, ulasan, dan wishlist. Berikut adalah penjelasan dari setiap endpoint:

1. **`/dashboard`**
   - **Method**: GET
   - **Deskripsi**: Endpoint untuk menampilkan pesan selamat datang. Ini merupakan titik awal atau halaman utama untuk API.
   - **Output**: Mengirimkan pesan teks "Selamat Datang di Database Good Reading Bookstore".

2. **`/books`**
   - **Controller**: `books.controller.js`
   - **Deskripsi**: Mengelola data terkait buku. Mendukung operasi CRUD (Create, Read, Update, Delete) untuk buku.
   - **Endpoints**:
     - **GET**: Mengambil daftar buku atau detail buku tertentu.
     - **POST**: Menambahkan buku baru.
     - **PUT/PATCH**: Memperbarui detail buku yang ada.
     - **DELETE**: Menghapus buku tertentu.

3. **`/customers`**
   - **Controller**: `customers.controller.js`
   - **Deskripsi**: Mengelola data terkait pelanggan. Mendukung operasi CRUD untuk pelanggan.
   - **Endpoints**:
     - **GET**: Mengambil daftar pelanggan atau detail pelanggan tertentu.
     - **POST**: Menambahkan pelanggan baru.
     - **PUT/PATCH**: Memperbarui detail pelanggan yang ada.
     - **DELETE**: Menghapus pelanggan tertentu.

4. **`/promotions`**
   - **Controller**: `promotions.controller.js`
   - **Deskripsi**: Mengelola data terkait promosi. Mendukung operasi CRUD untuk promosi.
   - **Endpoints**:
     - **GET**: Mengambil daftar promosi atau detail promosi tertentu.
     - **POST**: Menambahkan promosi baru.
     - **PUT/PATCH**: Memperbarui detail promosi yang ada.
     - **DELETE**: Menghapus promosi tertentu.

5. **`/reviews`**
   - **Controller**: `reviews.controller.js`
   - **Deskripsi**: Mengelola data terkait ulasan buku. Mendukung operasi CRUD untuk ulasan.
   - **Endpoints**:
     - **GET**: Mengambil daftar ulasan atau detail ulasan tertentu.
     - **POST**: Menambahkan ulasan baru.
     - **PUT/PATCH**: Memperbarui detail ulasan yang ada.
     - **DELETE**: Menghapus ulasan tertentu.

6. **`/wishlists`**
   - **Controller**: `wishlists.controller.js`
   - **Deskripsi**: Mengelola data terkait daftar keinginan pelanggan. Mendukung operasi CRUD untuk daftar keinginan.
   - **Endpoints**:
     - **GET**: Mengambil daftar keinginan atau detail daftar keinginan tertentu.
     - **POST**: Menambahkan item baru ke daftar keinginan.
     - **PUT/PATCH**: Memperbarui detail daftar keinginan yang ada.
     - **DELETE**: Menghapus item dari daftar keinginan tertentu.

### Kesimpulan
Kode yang dijelaskan menggunakan berbagai dependencies untuk membangun REST API yang modular dan efisien. Setiap endpoint diinisialisasikan untuk menangani operasi CRUD pada entitas berbeda yang diperlukan oleh aplikasi Good Reading Bookstore. Dengan struktur ini, aplikasi dapat dengan mudah dikembangkan dan dipelihara, serta memungkinkan penambahan fitur baru secara cepat dan efektif.
