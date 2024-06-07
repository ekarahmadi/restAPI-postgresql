const {
    getAllWishlists,
    getWishlistByCustomerId,
    getWishlistByBookId,
    createWishlist,
    updateWishlist,
    deleteWishlist
} = require("./wishlists.repository");

module.exports = {
    getAllWishlists,
    getWishlistByCustomerId,
    getWishlistByBookId,
    createWishlist,
    updateWishlist,
    deleteWishlist
};
