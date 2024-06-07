const express = require("express");
const {
    getAllBooks,
    getBookById,
    createBook,
    updateBook,
    patchBook,
    deleteBook
} = require("./books.service"); 

const router = express.Router();

router.get("/", async (req, res) => {
    try {
        const books = await getAllBooks();
        res.json(books);
    } catch (error) {
        console.error("Kesalahan mengambil data buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

router.get("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const book = await getBookById(id);
        if (book) {
            res.status(200).json({ data: book });
        } else {
            res.status(404).json({ message: "Buku tidak ditemukan" });
        }
    } catch (error) {
        console.error("Kesalahan mengambil data buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

router.post("/", async (req, res) => {
    const { book_name, pages, publication_year, publisher_id, language_id } = req.body;
    try {
        if (!book_name || !publication_year || !publisher_id || !language_id) {
            return res.status(400).json({ message: "Semua kolom yang diperlukan harus diisi" });
        }

        const newBook = await createBook({
            book_name,
            pages,
            publication_year,
            publisher_id,
            language_id
        });
        res.status(201).json({ message: "Buku berhasil ditambahkan", data: newBook });
    } catch (error) {
        console.error("Kesalahan membuat buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

router.put("/:id", async (req, res) => {
    const { id } = req.params;
    const { book_name, pages, publication_year, publisher_id, language_id } = req.body;
    try {
        if (!book_name || !publication_year || !publisher_id || !language_id) {
            return res.status(400).json({ message: "Semua kolom yang diperlukan harus diisi" });
        }

        const updatedBook = await updateBook(id, {
            book_name,
            pages,
            publication_year,
            publisher_id,
            language_id
        });
        res.status(200).json({ message: "Buku berhasil diperbarui", data: updatedBook });
    } catch (error) {
        console.error("Kesalahan memperbarui buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

router.patch("/:id", async (req, res) => {
    const { id } = req.params;
    const { book_name, pages, publication_year, publisher_id, language_id } = req.body;
    try {
        if (!book_name && !pages && !publication_year && !publisher_id && !language_id) {
            return res.status(400).json({ message: "Setidaknya satu kolom harus diisi untuk pembaruan" });
        }

        const updatedBook = await patchBook(id, {
            book_name,
            pages,
            publication_year,
            publisher_id,
            language_id
        });
        res.status(200).json({ message: "Buku berhasil diperbarui", data: updatedBook });
    } catch (error) {
        console.error("Kesalahan memperbarui buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

router.delete("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await deleteBook(id);
        res.status(200).json({ message: "Buku berhasil dihapus" });
    } catch (error) {
        console.error("Kesalahan menghapus buku:", error);
        res.status(500).json({ message: "Terjadi kesalahan saat memproses permintaan" });
    }
});

module.exports = router;
