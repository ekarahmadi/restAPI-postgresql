// customer.repository.js
const prisma = require('../db'); // Sesuaikan dengan path module prisma Anda

/**
 * Mengambil semua customer dari database.
 * @returns {Promise<Array>} - Daftar semua customer.
 */
async function findAllCustomers() {
    try {
        return await prisma.customer.findMany();
    } catch (error) {
        console.error("Error fetching customers:", error);
        throw new Error("Error fetching customers");
    }
}

/**
 * Mengambil satu customer berdasarkan ID.
 * @param {number} id - ID dari customer.
 * @returns {Promise<Object>} - Data customer yang ditemukan.
 */
async function findCustomerById(id) {
    try {
        return await prisma.customer.findUnique({
            where: { customer_id: parseInt(id) }
        });
    } catch (error) {
        console.error("Error fetching customer:", error);
        throw new Error("Error fetching customer");
    }
}

/**
 * Membuat customer baru.
 * @param {Object} data - Data untuk customer baru.
 * @returns {Promise<Object>} - Data customer yang baru dibuat.
 */
async function createCustomer(data) {
    try {
        return await prisma.customer.create({
            data: {
                customer_name: data.customer_name,
                customer_email: data.customer_email,
                city_id: data.city_id,
                store_id: data.store_id,
                last_update: data.last_update || new Date()
            }
        });
    } catch (error) {
        console.error("Error creating customer:", error);
        throw new Error("Error creating customer");
    }
}

/**
 * Memperbarui customer berdasarkan ID.
 * @param {number} id - ID dari customer yang akan diperbarui.
 * @param {Object} data - Data baru untuk customer.
 * @returns {Promise<Object>} - Data customer yang diperbarui.
 */
async function updateCustomer(id, data) {
    try {
        return await prisma.customer.update({
            where: { customer_id: parseInt(id) },
            data: {
                customer_name: data.customer_name,
                customer_email: data.customer_email,
                city_id: data.city_id,
                store_id: data.store_id,
                last_update: new Date()
            }
        });
    } catch (error) {
        console.error("Error updating customer:", error);
        throw new Error("Error updating customer");
    }
}

/**
 * Memperbarui beberapa field customer berdasarkan ID.
 * @param {number} id - ID dari customer yang akan diperbarui.
 * @param {Object} data - Data baru untuk customer.
 * @returns {Promise<Object>} - Data customer yang diperbarui.
 */
async function patchCustomer(id, data) {
    try {
        return await prisma.customer.update({
            where: { customer_id: parseInt(id) },
            data: {
                ...data,
                last_update: new Date()
            }
        });
    } catch (error) {
        console.error("Error patching customer:", error);
        throw new Error("Error patching customer");
    }
}

/**
 * Menghapus customer berdasarkan ID.
 * @param {number} id - ID dari customer yang akan dihapus.
 * @returns {Promise<void>}
 */
async function deleteCustomer(id) {
    try {
        await prisma.customer.delete({
            where: { customer_id: parseInt(id) }
        });
    } catch (error) {
        console.error("Error deleting customer:", error);
        throw new Error("Error deleting customer");
    }
}

module.exports = {
    findAllCustomers,
    findCustomerById,
    createCustomer,
    updateCustomer,
    patchCustomer,
    deleteCustomer
};
