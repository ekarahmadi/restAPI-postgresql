const { query } = require('../db');

async function getAllReviews() {
    try {
        const sql = `
            SELECT
                r.*,
                b.book_name,
                c.customer_name
            FROM
                review r
                INNER JOIN book b ON r.book_id = b.book_id
                INNER JOIN customer c ON r.customer_id = c.customer_id
        `;
        return await query(sql);
    } catch (error) {
        console.error("Error fetching reviews:", error);
        throw new Error("Failed to fetch reviews");
    }
}

async function getReviewById(id) {
    try {
        const sql = `
            SELECT
                r.*,
                b.book_name,
                c.customer_name
            FROM
                review r
                INNER JOIN book b ON r.book_id = b.book_id
                INNER JOIN customer c ON r.customer_id = c.customer_id
            WHERE
                r.review_id = $1
        `;
        const result = await query(sql, [id]);
        if (!result || !result.rows || result.rows.length === 0) {
            throw new Error(`Review with ID ${id} not found`);
        }
        return result.rows[0]; // Return the first row of the result
    } catch (error) {
        console.error(`Error fetching review with ID ${id}:`, error);
        throw new Error(`Failed to fetch review with ID ${id}`);
    }
}

async function createReview(data) {
    try {
        const { customer_id, book_id, rating, comment, review_date } = data;
        const sql = `
            INSERT INTO review (customer_id, book_id, rating, comment, review_date)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING *
        `;
        const result = await query(sql, [customer_id, book_id, rating, comment, review_date]);
        return result.rows[0]; // Return the first row of the result
    } catch (error) {
        console.error("Error creating review:", error);
        throw new Error("Failed to create review");
    }
}

async function updateReview(id, data) {
    try {
        const { customer_id, book_id, rating, comment, review_date } = data;
        const sql = `
            UPDATE review
            SET customer_id = $1, book_id = $2, rating = $3, comment = $4, review_date = $5
            WHERE review_id = $6
            RETURNING *
        `;
        const result = await query(sql, [customer_id, book_id, rating, comment, review_date, id]);
        return result.rows[0]; // Return the first row of the result
    } catch (error) {
        console.error(`Error updating review with ID ${id}:`, error);
        throw new Error(`Failed to update review with ID ${id}`);
    }
}

async function patchReview(id, data) {
    try {
        const fields = Object.entries(data).filter(([key, value]) => value !== undefined && value !== null);
        const setClause = fields.map(([key, value], index) => `${key} = $${index + 1}`).join(", ");
        const values = fields.map(([key, value]) => value);
        const sql = `UPDATE review SET ${setClause} WHERE review_id = $${fields.length + 1} RETURNING *`;
        const result = await query(sql, [...values, id]);
        return result.rows[0]; // Return the first row of the result
    } catch (error) {
        console.error(`Error patching review with ID ${id}:`, error);
        throw new Error(`Failed to patch review with ID ${id}`);
    }
}

async function deleteReview(id) {
    try {
        const sql = "DELETE FROM review WHERE review_id = $1";
        await query(sql, [id]);
    } catch (error) {
        console.error(`Error deleting review with ID ${id}:`, error);
        throw new Error(`Failed to delete review with ID ${id}`);
    }
}

module.exports = {
    getAllReviews,
    getReviewById,
    createReview,
    updateReview,
    patchReview,
    deleteReview
};
