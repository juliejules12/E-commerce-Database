# 🛒 E-commerce Database

A relational SQL schema for an e-commerce platform, complete with sample data and an ER diagram. Designed for learning, testing, or backend dev setups.

---

## 📦 Files

- `ecommerce.sql` – Database schema
- `insert_sample.sql` – Sample data
- `E-commerce-Database.drawio.png` – ER diagram

---

## ⚙️ Setup

```sql
CREATE DATABASE ecommerce;
bash
Copy
Edit
mysql -u user -p ecommerce < ecommerce.sql
mysql -u user -p ecommerce < insert_sample.sql
🗺️ ER Diagram


🧱 Key Tables
users
id, name, email, password, created_at

products
id, name, description, price, stock, category_id, brand_id

orders
id, user_id, order_date, status, total_amount

order_items
id, order_id, product_id, quantity, price

payments
id, order_id, payment_method, status, amount

...plus tables for images, sizes, colors, attributes, and product variants.

🧪 Sample Data
Includes users, products, categories, orders, and more for instant testing.

🤝 Team & Collaboration
This project was built with collaboration in mind. Contributions welcome!
