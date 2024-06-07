### Download Full-Project (karena ada beberapa file tidak bisa teruploud) : https://drive.google.com/file/d/1CwRmYzWPNluB80QNG4SpyQskSl2EMQj_/view?usp=sharing
###
### ER Diagram Database
<img src="ERD Diagram GRB.png" alt="Diagram" />

 Penjelasan Struktur File, Dependencies dan Endpoints

#### **Dependencies yang Digunakan**

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

6. **`prisma` (Versi: ^5.15.0) (tidak jadi digunakan)**
   - **Fungsi**: Alat ORM untuk Node.js yang membantu dalam pengelolaan basis data.
   - **Kegunaan**: Mempermudah pembuatan model data, migrasi database, dan eksekusi query dengan cara yang lebih terstruktur dan aman dibandingkan dengan penulisan SQL manual.

7. **`nodemon` (Versi: ^3.1.3)**
   - **Fungsi**: Alat pengembangan yang memantau perubahan pada berkas dan secara otomatis me-restart server.
   - **Kegunaan**: Membantu mempercepat pengembangan dengan meminimalisir kebutuhan untuk me-restart server secara manual setiap kali ada perubahan pada kode.

Proyek ini memiliki struktur direktori yang tertata rapi, memungkinkan pengelolaan modul secara efisien dan memudahkan pengembangan serta pemeliharaan. Berikut adalah penjelasan singkat mengenai struktur direktori dan endpoint yang diimplementasikan:

### Struktur Directory Proyek

- **`/src`**: Direktori utama untuk semua kode sumber.
  - **`/books`**: Modul untuk mengelola data buku.
    - `books.controller.js`: Mengatur endpoint HTTP untuk buku.
    - `books.service.js`: Mengelola logika bisnis terkait buku.
    - `books.repository.js`: Berinteraksi dengan database untuk buku.
  - **`/customers`**: Modul untuk mengelola data pelanggan.
    - `customers.controller.js`
    - `customers.service.js`
    - `customers.repository.js`
  - **`/promotions`**: Modul untuk mengelola data promosi.
    - `promotions.controller.js`
    - `promotions.service.js`
    - `promotions.repository.js`
  - **`/reviews`**: Modul untuk mengelola data ulasan.
    - `reviews.controller.js`
    - `reviews.service.js`
    - `reviews.repository.js`
  - **`/wishlists`**: Modul untuk mengelola data wishlist.
    - `wishlists.controller.js`
    - `wishlists.service.js`
    - `wishlists.repository.js`
  - **`index.js`**: File utama untuk menjalankan server Express dan mengatur routing.

### Endpoint yang Diimplementasikan

- **`/books`**: Mengelola data buku.
  - `GET /books`: Mendapatkan daftar semua buku.
  - `GET /books/:id`: Mendapatkan detail buku berdasarkan ID.
  - `POST /books`: Menambahkan buku baru.
  - `PUT /books/:id`: Memperbarui data buku berdasarkan ID.
  - `PATCH /books/:id`: Memperbarui sebagian data buku berdasarkan ID.
  - `DELETE /books/:id`: Menghapus buku berdasarkan ID.

- **`/customers`**: Mengelola data pelanggan.
  - `GET /customers`: Mendapatkan daftar semua pelanggan.
  - `GET /customers/:id`: Mendapatkan detail pelanggan berdasarkan ID.
  - `POST /customers`: Menambahkan pelanggan baru.
  - `PUT /customers/:id`: Memperbarui data pelanggan berdasarkan ID.
  - `PATCH /customers/:id`: Memperbarui sebagian data pelanggan berdasarkan ID.
  - `DELETE /customers/:id`: Menghapus pelanggan berdasarkan ID.

- **`/promotions`**: Mengelola data promosi.
  - `GET /promotions`: Mendapatkan daftar semua promosi.
  - `GET /promotions/:id`: Mendapatkan detail promosi berdasarkan ID.
  - `POST /promotions`: Menambahkan promosi baru.
  - `PUT /promotions/:id`: Memperbarui data promosi berdasarkan ID.
  - `PATCH /promotions/:id`: Memperbarui sebagian data promosi berdasarkan ID.
  - `DELETE /promotions/:id`: Menghapus promosi berdasarkan ID.

- **`/reviews`**: Mengelola data ulasan.
  - `GET /reviews`: Mendapatkan daftar semua ulasan.
  - `GET /reviews/:id`: Mendapatkan detail ulasan berdasarkan ID.
  - `POST /reviews`: Menambahkan ulasan baru.
  - `PUT /reviews/:id`: Memperbarui data ulasan berdasarkan ID.
  - `PATCH /reviews/:id`: Memperbarui sebagian data ulasan berdasarkan ID.
  - `DELETE /reviews/:id`: Menghapus ulasan berdasarkan ID.

- **`/wishlists`**: Mengelola data wishlist.
  - `GET /wishlists`: Mendapatkan daftar semua wishlist.
  - `GET /wishlists/customer/:customerId`: Mendapatkan wishlist berdasarkan ID pelanggan.
  - `POST /wishlists`: Menambahkan wishlist baru.
  - `PUT /wishlists/:customerId/:bookId`: Memperbarui data wishlist berdasarkan ID pelanggan dan buku.
  - `PATCH /wishlists/:customerId/:bookId`: Memperbarui sebagian data wishlist berdasarkan ID pelanggan dan buku.
  - `DELETE /wishlists/:customerId/:bookId`: Menghapus wishlist berdasarkan ID pelanggan dan buku.

### Kesimpulan
Kode yang dijelaskan menggunakan berbagai dependencies untuk membangun REST API yang modular dan efisien. Setiap endpoint diinisialisasikan untuk menangani operasi CRUD pada entitas berbeda yang diperlukan oleh aplikasi Good Reading Bookstore. Dengan struktur ini, aplikasi dapat dengan mudah dikembangkan dan dipelihara, serta memungkinkan penambahan fitur baru secara cepat dan efektif. Struktur direktori ini memastikan bahwa setiap modul memiliki tanggung jawab yang jelas dan terpisah, sementara endpoint yang diimplementasikan memungkinkan operasi CRUD pada setiap entitas, mendukung fleksibilitas dan skalabilitas dalam pengelolaan data di aplikasi toko buku.
