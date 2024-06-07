const { query } = require('../db'); // Sesuaikan dengan path module koneksi database Anda

// Fungsi untuk mengambil semua customer
async function getAllCustomers() {
    const sql = "SELECT * FROM customer";
    return await query(sql);
}

// Fungsi untuk mengambil satu customer berdasarkan ID
async function getCustomerById(id) {
    const sql = "SELECT * FROM customer WHERE customer_id = $1";
    return await query(sql, [id]);
}

// Fungsi untuk membuat customer baru
async function createCustomer(data) {
    const { customer_name, customer_email, city_id, store_id, last_update } = data;
    const sql = "INSERT INTO customer (customer_name, customer_email, city_id, store_id, last_update) VALUES ($1, $2, $3, $4, $5) RETURNING *";
    return await query(sql, [customer_name, customer_email, city_id, store_id, last_update || new Date()]);
}

// Fungsi untuk mengupdate customer berdasarkan ID
async function updateCustomer(id, data) {
    const { customer_name, customer_email, city_id, store_id } = data;
    const sql = "UPDATE customer SET customer_name = $1, customer_email = $2, city_id = $3, store_id = $4, last_update = $5 WHERE customer_id = $6 RETURNING *";
    return await query(sql, [customer_name, customer_email, city_id, store_id, new Date(), id]);
}

// Fungsi untuk mengupdate beberapa field customer berdasarkan ID
async function patchCustomer(id, data) {
    const fields = Object.entries(data).filter(([key, value]) => value !== undefined && value !== null);
    const setClause = fields.map(([key, value], index) => `${key} = $${index + 1}`).join(", ");
    const values = fields.map(([key, value]) => value);
    const sql = `UPDATE customer SET ${setClause}, last_update = $${fields.length + 1} WHERE customer_id = $${fields.length + 2} RETURNING *`;
    return await query(sql, [...values, new Date(), id]);
}

// Fungsi untuk menghapus customer berdasarkan ID
async function deleteCustomer(id) {
    const sql = "DELETE FROM customer WHERE customer_id = $1";
    await query(sql, [id]);
}

module.exports = {
    getAllCustomers,
    getCustomerById,
    createCustomer,
    updateCustomer,
    patchCustomer,
    deleteCustomer
};
