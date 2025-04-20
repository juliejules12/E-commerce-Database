🛍️ E-commerce Database Project
📌 Overview
This project presents a robust e-commerce relational database schema designed for managing brands, products, categories, and attributes such as size, color, and stock levels.

The database supports:

Designer fashion and sportswear (shoes, clothes, bags)

Gadgets and high-tech accessories

Flexible attribute and variation management

🧠 Group 276 collaborated on the design, implementation, and documentation.

📁 Project Structure
pgsql
Copy
Edit
ecommerce-database/
├── ecommerce.sql            -- Full schema: tables, constraints, relationships
├── insert_sample.sql        -- Sample data for testing
├── E-commerce-Database.drawio.png -- Visual ERD (Entity Relationship Diagram)
├── README.md                -- This file
⚙️ How to Use
📌 Requirements
MySQL Server (e.g., MySQL 8+ or MariaDB)

Any SQL client or terminal

🔧 Steps
Create the database

sql
Copy
Edit
CREATE DATABASE ecommerce;
USE ecommerce;
Run the schema script

Import ecommerce.sql in your SQL tool or via terminal:

bash
Copy
Edit
mysql -u root -p ecommerce < ecommerce.sql
Insert sample data

bash
Copy
Edit
mysql -u root -p ecommerce < insert_sample.sql
🗺️ Entity Relationship Diagram (ERD)

The ERD shows how brands, categories, and products are connected, including variations like color, size, and custom attributes.

🧪 Example Queries
Some test queries you can try after loading the data:

sql
Copy
Edit
-- All Products
SELECT * FROM product;

-- Products with brand & category
SELECT p.name, b.name AS brand, c.name AS category
FROM product p
JOIN brand b ON p.brand_id = b.brand_id
JOIN product_category c ON p.category_id = c.category_id;

-- Products over $1000
SELECT name, base_price FROM product WHERE base_price > 1000;
🤝 Contributors
Group 276
