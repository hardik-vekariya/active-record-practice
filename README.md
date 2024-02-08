# Bookstore

This repository contains a database schema for a fictional online bookstore. It includes tables for authors, books, customers, orders, reviews, suppliers, and a join table for book-order associations.

## Purpose of this repository

If you want to practice ActiveRecord queries, this repository provides a sandbox environment for honing your skills. Additionally, you can utilize the `query_practice.rb` file, which contains sample query statements to guide your practice sessions.

## Schema Overview

The database schema consists of the following tables:

- **Authors**: Stores information about authors, including their first name, last name, and title.
- **Books**: Contains details about books, such as title, year published, ISBN, price, views, and whether the book is out of print. It also includes foreign keys to link books with authors and suppliers.
- **Customers**: Stores information about customers, including their first name, last name, title, email, and visit/order counts.
- **Orders**: Contains details about orders, such as the date submitted, status, subtotal, shipping, tax, and total amount. It includes a foreign key to link orders with customers.
- **Reviews**: Stores customer reviews for books, including the title, body, rating, and state of the review. It includes foreign keys to link reviews with customers and books.
- **Suppliers**: Contains information about book suppliers, including their name.
- **Books_Orders**: A join table to establish a many-to-many relationship between books and orders.

## Usage

### Setting Up the Database

1. Clone the repository:

   ```bash
   git clone https://github.com/hardik-vekariya/active-record-practice.git

2. Navigate to the project directory:

   ```bash
   cd bookstore

3. Setup your project dependancy:

4. Setup your database:

   ```bash
   rails db:setup

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or create a pull request.
