const express = require("express");
const dotenv = require("dotenv");
const app = express();

dotenv.config();
app.use(express.json());
 
const PORT = process.env.PORT;

app.get("/dashboard", (req, res) =>{
    res.send("Selamat Datang di Database Good Reading Bookstore");
});

const booksController = require("./books/books.controller");
app.use('/books', booksController)

const customersController = require("./customers/customers.controller");
app.use('/customers', customersController)

const promotionController = require("./promotions/promotions.controller");
app.use('/promotions', promotionController)

const reviewsController = require("./reviews/reviews.controller");
app.use('/reviews', reviewsController)

const wishlistsController = require("./wishlists/wishlists.controller");
app.use('/wishlists', wishlistsController)

app.listen(PORT, () =>{
    console.log("Express API running in port: " + PORT);
});