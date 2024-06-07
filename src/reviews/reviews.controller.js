const express = require('express');
const {
    getAllReviews,
    getReviewById,
    createReview,
    updateReview,
    patchReview,
    deleteReview
} = require('./reviews.service');

const router = express.Router();

// READ all reviews
router.get('/', async (req, res) => {
    try {
        const reviews = await getAllReviews();
        res.json(reviews);
    } catch (error) {
        console.error('Error fetching reviews:', error);
        res.status(500).send('Internal server error');
    }
});

// READ single review by ID
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const review = await getReviewById(parseInt(id));
        if (review) {
            res.status(200).json({ message: 'Review found', data: review });
        } else {
            res.status(404).json({ message: 'Review not found' });
        }
    } catch (error) {
        console.error('Error fetching review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// CREATE a new review
router.post('/', async (req, res) => {
    const { customer_id, book_id, rating, comment, review_date } = req.body;
    try {
        if (!customer_id || !book_id || rating == null) {
            return res.status(400).json({ message: 'All required fields must be provided' });
        }

        const newReview = await createReview({ customer_id, book_id, rating, comment, review_date });
        res.status(201).json({ message: 'Review created successfully', data: newReview });
    } catch (error) {
        console.error('Error creating review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// UPDATE a review by ID
router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const { customer_id, book_id, rating, comment, review_date } = req.body;
    try {
        if (!customer_id || !book_id || rating == null) {
            return res.status(400).json({ message: 'All required fields must be provided' });
        }

        const updatedReview = await updateReview(parseInt(id), { customer_id, book_id, rating, comment, review_date });
        res.status(200).json({ message: 'Review updated successfully', data: updatedReview });
    } catch (error) {
        console.error('Error updating review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// PATCH a review by ID
router.patch('/:id', async (req, res) => {
    const { id } = req.params;
    const { customer_id, book_id, rating, comment, review_date } = req.body;
    try {
        if (!customer_id && !book_id && rating == null && !comment && !review_date) {
            return res.status(400).json({ message: 'At least one field must be provided for update' });
        }

        const updatedReview = await patchReview(parseInt(id), { customer_id, book_id, rating, comment, review_date });
        res.status(200).json({ message: 'Review updated successfully', data: updatedReview });
    } catch (error) {
        console.error('Error patching review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// DELETE a review by ID
router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await deleteReview(parseInt(id));
        res.status(200).json({ message: 'Review deleted successfully' });
    } catch (error) {
        console.error('Error deleting review:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

module.exports = router;
