const { query } = require('../db');

async function getAllWishlists() {
    const sql = `
        SELECT
            w.*,
            b.*,
            c.*
        FROM
            wishlist w
            INNER JOIN book b ON w.book_id = b.book_id
            INNER JOIN customer c ON w.customer_id = c.customer_id
    `;
    return await query(sql);
}

async function getWishlistByCustomerId(customer_id) {
    const sql = `
        SELECT
            w.*,
            b.*
        FROM
            wishlist w
            INNER JOIN book b ON w.book_id = b.book_id
        WHERE
            w.customer_id = $1
    `;
    return await query(sql, [customer_id]);
}

async function getWishlistByBookId(bookId) {
    const sql = `
        SELECT
            w.*,
            b.*
        FROM
            wishlist w
            INNER JOIN book b ON w.book_id = b.book_id
        WHERE
            w.book_id = $1
    `;
    return await query(sql, [bookId]);
}

async function createWishlist(data) {
    const { customer_id, book_id, last_update } = data;
    const sql = `
        INSERT INTO wishlist (customer_id, book_id, last_update)
        VALUES ($1, $2, $3)
        RETURNING *
    `;
    return await query(sql, [customer_id, book_id, last_update || new Date()]);
}

async function updateWishlist(customer_id, book_id, data) {
    const { last_update } = data;
    const sql = `
        UPDATE wishlist
        SET last_update = $1
        WHERE customer_id = $2 AND book_id = $3
        RETURNING *
    `;
    return await query(sql, [last_update || new Date(), customer_id, book_id]);
}

async function deleteWishlist(customer_id, book_id) {
    const sql = `
        DELETE FROM wishlist
        WHERE customer_id = $1 AND book_id = $2
    `;
    return await query(sql, [customer_id, book_id]);
}

module.exports = {
    getAllWishlists,
    getWishlistByCustomerId,
    getWishlistByBookId,
    createWishlist,
    updateWishlist,
    deleteWishlist
};
