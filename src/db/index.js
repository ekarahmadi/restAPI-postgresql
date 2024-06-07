
const { Pool } = require('pg');

// Konfigurasi koneksi ke basis data PostgreSQL
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'GRB_TBD_DB',
    password: 'root',
    port: 5432, // Port default untuk PostgreSQL
});

// Fungsi untuk mengeksekusi kueri SQL
async function query(sql, params = []) {
    const client = await pool.connect();
    try {
        const result = await client.query(sql, params);
        return result.rows;
    } finally {
        client.release();
    }
}

module.exports = {
    query
};
