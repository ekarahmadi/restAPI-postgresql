const { query } = require("../db");

async function getAllBooks() {
    const sql = "SELECT * FROM book";
    return await query(sql);
}
async function createBook(bookData) {
    const { book_name, pages, publication_year, publisher_id, language_id } = bookData;
    const sql = "INSERT INTO book (book_name, pages, publication_year, publisher_id, language_id) VALUES ($1, $2, $3, $4, $5) RETURNING *";
    return await query(sql, [book_name, pages, publication_year, publisher_id, language_id]);
}

async function getBookById(id) {
    const sql = "SELECT * FROM book WHERE book_id = $1";
    return await query(sql, [id]);
}

async function updateBook(id, bookData) {
    const { book_name, pages, publication_year, publisher_id, language_id } = bookData;
    const sql = "UPDATE book SET book_name = $1, pages = $2, publication_year = $3, publisher_id = $4, language_id = $5 WHERE book_id = $6 RETURNING *";
    return await query(sql, [book_name, pages, publication_year, publisher_id, language_id, id]);
}

async function patchBook(id, bookData) {
    const fields = Object.entries(bookData).filter(([key, value]) => value !== undefined && value !== null);
    const setClause = fields.map(([key, value], index) => `${key} = $${index + 1}`).join(", ");
    const values = fields.map(([key, value]) => value);
    const sql = `UPDATE book SET ${setClause} WHERE book_id = $${fields.length + 1} RETURNING *`;
    return await query(sql, [...values, id]);
}

async function deleteBook(id) {
    const sql = "DELETE FROM book WHERE book_id = $1";
    await query(sql, [id]);
}

module.exports = {
    getAllBooks,
    getBookById,
    createBook,
    updateBook,
    patchBook,
    deleteBook
};
