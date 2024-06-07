const express = require('express');

const {
    getAllPromotions,
    getPromotionById,
    createPromotion,
    updatePromotion,
    patchPromotion,
    deletePromotion
} = require('./promotions.service');

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const promotions = await getAllPromotions();
        res.json(promotions);
    } catch (error) {
        console.error('Kesalahan mengambil data promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat mengambil data promosi' });
    }
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const promotion = await getPromotionById(parseInt(id));
        if (promotion) {
            res.status(200).json({ message: 'Promosi ditemukan', data: promotion });
        } else {
            res.status(404).json({ message: 'Promosi tidak ditemukan' });
        }
    } catch (error) {
        console.error('Kesalahan mengambil data promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat mengambil data promosi' });
    }
});

router.post('/', async (req, res) => {
    const { promotion_name, start_date, end_date, description, discount } = req.body;
    try {
        if (!promotion_name || !start_date || !end_date || discount == null) {
            return res.status(400).json({ message: 'Semua kolom yang diperlukan harus diisi' });
        }

        const newPromotion = await createPromotion({ promotion_name, start_date, end_date, description, discount });
        res.status(201).json({ message: 'Promosi berhasil dibuat', data: newPromotion });
    } catch (error) {
        console.error('Kesalahan membuat promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat membuat promosi' });
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const { promotion_name, start_date, end_date, description, discount } = req.body;
    try {
        if (!promotion_name || !start_date || !end_date || discount == null) {
            return res.status(400).json({ message: 'Semua kolom yang diperlukan harus diisi' });
        }

        const updatedPromotion = await updatePromotion(parseInt(id), { promotion_name, start_date, end_date, description, discount });
        res.status(200).json({ message: 'Promosi berhasil diperbarui', data: updatedPromotion });
    } catch (error) {
        console.error('Kesalahan memperbarui promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat memperbarui promosi' });
    }
});

router.patch('/:id', async (req, res) => {
    const { id } = req.params;
    const { promotion_name, start_date, end_date, description, discount } = req.body;
    try {
        if (!promotion_name && !start_date && !end_date && !description && discount == null) {
            return res.status(400).json({ message: 'Setidaknya satu kolom harus diisi untuk pembaruan' });
        }

        const updatedPromotion = await patchPromotion(parseInt(id), { promotion_name, start_date, end_date, description, discount });
        res.status(200).json({ message: 'Promosi berhasil diperbarui', data: updatedPromotion });
    } catch (error) {
        console.error('Kesalahan memperbarui promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat memperbarui promosi' });
    }
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await deletePromotion(parseInt(id));
        res.status(200).json({ message: 'Promosi berhasil dihapus' });
    } catch (error) {
        console.error('Kesalahan menghapus promosi:', error);
        res.status(500).json({ message: 'Terjadi kesalahan saat menghapus promosi' });
    }
});

module.exports = router;
