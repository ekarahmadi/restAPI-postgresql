const { query } = require('../db');

async function getAllPromotions() {
    const sql = "SELECT * FROM promotion";
    return await query(sql);
}

async function getPromotionById(id) {
    const sql = "SELECT * FROM promotion WHERE promotion_id = $1";
    return await query(sql, [id]);
}

async function createPromotion(data) {
    const { promotion_name, start_date, end_date, description, discount } = data;
    const sql = "INSERT INTO promotion (promotion_name, start_date, end_date, description, discount) VALUES ($1, $2, $3, $4, $5) RETURNING *";
    return await query(sql, [promotion_name, new Date(start_date), new Date(end_date), description, discount]);
}

async function updatePromotion(id, data) {
    const { promotion_name, start_date, end_date, description, discount } = data;
    const sql = "UPDATE promotion SET promotion_name = $1, start_date = $2, end_date = $3, description = $4, discount = $5 WHERE promotion_id = $6 RETURNING *";
    return await query(sql, [promotion_name, new Date(start_date), new Date(end_date), description, discount, id]);
}

async function patchPromotion(id, data) {
    const fields = Object.entries(data).filter(([key, value]) => value !== undefined && value !== null);
    const setClause = fields.map(([key, value], index) => `${key} = $${index + 1}`).join(", ");
    const values = fields.map(([key, value]) => value);
    const sql = `UPDATE promotion SET ${setClause} WHERE promotion_id = $${fields.length + 1} RETURNING *`;
    return await query(sql, [...values, id]);
}

async function deletePromotion(id) {
    const sql = "DELETE FROM promotion WHERE promotion_id = $1";
    await query(sql, [id]);
}

module.exports = {
    getAllPromotions,
    getPromotionById,
    createPromotion,
    updatePromotion,
    patchPromotion,
    deletePromotion
};
