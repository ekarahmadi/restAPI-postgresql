// wishlists.router.js
const express = require('express');
const {
    getAllWishlists,
    getWishlistByCustomerId,
    getWishlistByBookId,
    createWishlist,
    updateWishlist,
    deleteWishlist
} = require('./wishlists.service'); // Sesuaikan path dengan lokasi service Anda

const router = express.Router();

// READ all wishlists
router.get('/', async (req, res) => {
    try {
        const wishlists = await getAllWishlists();
        res.json(wishlists);
    } catch (error) {
        console.error('Error fetching wishlists:', error);
        res.status(500).send('Internal server error');
    }
});

// READ wishlist by Customer ID
router.get('/customer/:customerId', async (req, res) => {
    const { customerId } = req.params;
    try {
        const wishlist = await getWishlistByCustomerId(parseInt(customerId));
        if (wishlist) {
            res.status(200).json({ message: 'Wishlist found', data: wishlist });
        } else {
            res.status(404).json({ message: 'Wishlist not found' });
        }
    } catch (error) {
        console.error('Error fetching wishlist:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// READ wishlist by Book ID
router.get('/book/:bookID', async (req, res) => {
    const { bookID } = req.params; // Mengambil bookID dari params, bukan customerId
    try {
        const wishlist = await getWishlistByBookId(parseInt(bookID)); // Menggunakan getWishlistByBookId
        if (wishlist) {
            res.status(200).json({ message: 'Wishlist found', data: wishlist });
        } else {
            res.status(404).json({ message: 'Wishlist not found' });
        }
    } catch (error) {
        console.error('Error fetching wishlist:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// CREATE a new wishlist
router.post('/', async (req, res) => {
    const { customer_id, book_id } = req.body;
    try {
        if (!customer_id || !book_id) {
            return res.status(400).json({ message: 'All required fields must be provided' });
        }

        const newWishlist = await createWishlist({ customer_id, book_id });
        res.status(201).json({ message: 'Wishlist created successfully', data: newWishlist });
    } catch (error) {
        console.error('Error creating wishlist:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// UPDATE a wishlist (for future extensibility)
router.put('/:customer_id/:book_id', async (req, res) => {
    const { customer_id, book_id } = req.params;
    const { last_update } = req.body;
    try {
        const updatedWishlist = await updateWishlist(parseInt(customer_id), parseInt(book_id), { last_update });
        res.status(200).json({ message: 'Wishlist updated successfully', data: updatedWishlist });
    } catch (error) {
        console.error('Error updating wishlist:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// DELETE a wishlist by Customer ID and Book ID
router.delete('/:customer_id/:book_id', async (req, res) => {
    const { customer_id, book_id } = req.params;
    try {
        await deleteWishlist(parseInt(customer_id), parseInt(book_id));
        res.status(200).json({ message: 'Wishlist deleted successfully' });
    } catch (error) {
        console.error('Error deleting wishlist:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

module.exports = router;
