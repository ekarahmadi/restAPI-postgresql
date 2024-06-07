const express = require('express');
const customerService = require('./customers.service');

const router = express.Router();

// Endpoint untuk mengambil semua customer
router.get("/", async (req, res) => {
    try {
        const customers = await customerService.getAllCustomers();
        res.json(customers);
    } catch (error) {
        console.error(error);
        res.status(500).send("Internal server error");
    }
});

// Endpoint untuk mengambil satu customer berdasarkan ID
router.get("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const customer = await customerService.getCustomerById(id);
        if (customer) {
            res.status(200).json({ message: "Customer found", data: customer });
        } else {
            res.status(404).json({ message: "Customer not found" });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal server error" });
    }
});

// Endpoint untuk membuat customer baru
router.post("/", async (req, res) => {
    const { customer_name, customer_email, city_id, store_id } = req.body;
    try {
        if (!customer_name) {
            return res.status(400).json({ message: "Customer name is required" });
        }

        const newCustomer = await customerService.createCustomer({ customer_name, customer_email, city_id, store_id });
        res.status(201).json({ message: "Customer created successfully", data: newCustomer });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal server error" });
    }
});

// Endpoint untuk mengupdate customer berdasarkan ID
router.put("/:id", async (req, res) => {
    const { id } = req.params;
    const { customer_name, customer_email, city_id, store_id } = req.body;
    try {
        if (!customer_name) {
            return res.status(400).json({ message: "Customer name is required" });
        }

        const updatedCustomer = await customerService.updateCustomer(id, { customer_name, customer_email, city_id, store_id });
        res.status(200).json({ message: "Customer updated successfully", data: updatedCustomer });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal server error" });
    }
});

// Endpoint untuk mengupdate beberapa field customer berdasarkan ID
router.patch("/:id", async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    try {
        if (Object.keys(data).length === 0) {
            return res.status(400).json({ message: "At least one field must be provided for update" });
        }

        const updatedCustomer = await customerService.patchCustomer(id, data);
        res.status(200).json({ message: "Customer updated successfully", data: updatedCustomer });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal server error" });
    }
});

// Endpoint untuk menghapus customer berdasarkan ID
router.delete("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        await customerService.deleteCustomer(id);
        res.status(200).json({ message: "Customer deleted successfully" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal server error" });
    }
});

module.exports = router;
