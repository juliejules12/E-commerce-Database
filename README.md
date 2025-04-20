# 🛒 E-Commerce Database

A collaborative SQL database project designed for a modern e-commerce platform. It includes a well-structured schema, ER diagram, and sample data—ideal for learning, development, and testing.

---

## 🛠️ Features

- **Structured Tables**: Brands, products, categories, sizes, variations, and attributes  
- **Relationships**: Foreign keys and constraints to ensure data integrity  
- **Data Flow**: Optimised entity relationships for typical e-commerce operations  

---

## 🗃️ Tables Created

### 🛍️ Product Information
- `product`: Stores general product details (e.g., name, base price, brand)  
- `product_category`: Classifies products into categories (e.g., clothing, electronics)  
- `product_item`: Represents purchasable items with specific variations  
- `product_image`: Stores image URLs or file references  
- `brand`: Product brand details  

### 🎨 Variations & Attributes
- `product_variation`: Links products to size and colour variations  
- `color`: Available colour options (name and hex code)  
- `size_category`: Groups sizes (e.g., clothing, shoes)  
- `size_option`: Lists specific sizes (e.g., S, M, L, 42)  
- `product_attribute`: Stores product-specific attributes (e.g., material, weight)  
- `attribute_category`: Groups attributes into categories (e.g., physical, technical)  
- `attribute_type`: Defines attribute types (e.g., text, number, boolean)  

---

## 📁 Files Included

- `ecommerce.sql` – SQL schema (tables, constraints, relationships)  
- `insert_sample.sql` – Sample data for testing  
- `E-commerce-Database.drawio.png` – ER diagram  

---

## ⚙️ Setup Instructions

1. Create the database:
   ```sql
   CREATE DATABASE ecommerce;
mysql -u your_user -p ecommerce < ecommerce.sql
mysql -u your_user -p ecommerce < insert_sample.sql

🖼️ ER Diagram
The Entity-Relationship Diagram (E-commerce-Database.drawio.png) visually represents the structure of the database.
It shows how tables such as products, variations, categories, and attributes are connected through relationships and foreign keys.

The diagram was created using draw.io, and it helps developers and learners quickly understand the database design and data flow between entities.

🧪 Sample Data Preview
A few rows of sample data included for testing:

Products Table


id	name	price	brand_id	category_id
1	T-Shirt Basic	15.99	1	2
2	Running Shoes	89.99	2	3
Colors Table


id	name	hex_code
1	Red	#FF0000
2	Blue	#0000FF
Sizes Table


id	value
1	S
2	M
3	L
The sample data includes users, categories, products, colours, sizes, attributes, and relationships for a functional e-commerce flow.

🤝 Group Contribution

This project was developed collaboratively by Group 27/6.
All members contributed to planning, database design, sample data creation, and documentation.

📂 Submission
✅ ERD file

✅ SQL schema

✅ Sample data

✅ Public GitHub repository for access and review

📜 License

This project is licensed for academic and educational purposes only.
© Group 27/6 – All rights reserved.


