-- ===================================
-- E-COMMERCE DATABASE SCHEMA
-- ===================================

-- 1. Brand Table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 2. Product Category Table
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 3. Product Table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 4. Product Image Table
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 5. Color Table
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    hex_code VARCHAR(7) -- Example: #FF5733
);

-- 6. Size Category Table
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) -- Example: Clothing, Shoes
);

-- 7. Size Option Table
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    label VARCHAR(20), -- Example: S, M, L, 42
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- 8. Product Variation Table
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- 9. Product Item Table (SKU level) - FIXED VERSION
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    sku VARCHAR(100) UNIQUE,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- 10. Attribute Type Table
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) -- Example: text, number, boolean
);

-- 11. Attribute Category Table
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) -- Example: Physical, Technical
);

-- 12. Product Attribute Table
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100), -- Example: Material, Weight
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- ===================================
-- SAMPLE DATA INSERTIONS
-- ===================================

-- 1. Insert data into 'brand' table
INSERT INTO brand (name, description) VALUES
('Gucci', 'Luxury Italian fashion house specializing in clothing, shoes, bags, and accessories'),
('Nike', 'Global sportswear company known for shoes, apparel, and gear'),
('Chanel', 'French luxury brand specializing in high-end fashion, shoes, and accessories'),
('Apple', 'Innovative technology company known for gadgets like phones, tablets, and laptops'),
('Louis Vuitton', 'Luxury French fashion brand known for bags, luggage, and accessories'),
('Adidas', 'Sportswear brand specializing in shoes, clothes, and sports equipment');

-- 2. Insert data into 'product_category' table
INSERT INTO product_category (name, description) VALUES
('Designer Shoes', 'High-end shoes from luxury brands'),
('Sports Shoes', 'Athletic footwear for all sports activities'),
('Clothing', 'Fashionable and comfortable clothes'),
('Bags', 'Designer bags and accessories for all occasions'),
('Gadgets', 'Electronics and high-tech gadgets');

-- 3. Insert data into 'product' table
INSERT INTO product (name, brand_id, category_id, base_price, description) VALUES
('Gucci High-Heel Shoes', 1, 1, 899.99, 'Luxury high-heel shoes made of premium leather'),
('Nike Air Max 90', 2, 2, 129.99, 'Classic running shoes designed for comfort and performance'),
('Chanel Tweed Jacket', 3, 3, 2999.99, 'Elegantly designed tweed jacket with Chanel’s signature style'),
('Apple iPhone 14', 4, 5, 1099.99, 'Latest iPhone model with advanced camera and design'),
('Louis Vuitton Monogram Tote', 5, 4, 1999.99, 'Classic Louis Vuitton tote bag with signature monogram'),
('Adidas UltraBoost', 6, 2, 179.99, 'High-performance running shoes with Boost cushioning');

-- 4. Insert data into 'color' table
INSERT INTO color (name, hex_code) VALUES
('Red', '#FF5733'),
('Blue', '#33A1FF'),
('Black', '#000000'),
('White', '#FFFFFF');

-- 5. Insert data into 'size_category' table
INSERT INTO size_category (name) VALUES
('Clothing'),
('Shoes');

-- 6. Insert data into 'size_option' table
INSERT INTO size_option (size_category_id, label) VALUES
(1, 'S'),
(1, 'M'),
(1, 'L'),
(2, '42'),
(2, '43');

-- 7. Insert data into 'product_variation' table
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 1, 1),  -- Gucci High-Heel Shoes, Red, Size S
(1, 2, 1),  -- Gucci High-Heel Shoes, Blue, Size S
(2, 3, 2),  -- Nike Air Max 90, Black, Size 42
(3, 4, 3),  -- Chanel Tweed Jacket, White, Size L
(4, 2, 2);  -- Apple iPhone 14, Blue, Size 43

-- 8. Insert data into 'product_item' table
INSERT INTO product_item (variation_id, sku, price, stock_quantity) VALUES
(1, 'SKU12345', 899.99, 50),  -- Gucci High-Heel Shoes (Red, Size S)
(2, 'SKU12346', 899.99, 30),  -- Gucci High-Heel Shoes (Blue, Size S)
(3, 'SKU12347', 129.99, 100), -- Nike Air Max 90 (Black, Size 42)
(4, 'SKU12348', 2999.99, 20), -- Chanel Tweed Jacket (White, Size L)
(5, 'SKU12349', 1099.99, 10); -- Apple iPhone 14 (Blue, Size 43)
