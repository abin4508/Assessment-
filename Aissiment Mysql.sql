CREATE DATABASE IF NOT EXISTS global_store_db;
USE global_store_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
ALTER TABLE products
ADD COLUMN category VARCHAR(50) AFTER price;
RENAME TABLE products TO inventory;
-- Inserting records into the inventory table
INSERT INTO inventory (name, price, quantity, category) VALUES
('Laptop', 999.99, 15, 'Electronics'),
('Smartphone', 499.99, 30, 'Electronics'),
('Desk Chair', 89.99, 50, 'Furniture'),
('Table Lamp', 39.99, 20, 'Furniture'),
('Headphones', 149.99, 25, 'Electronics'),
('Monitor', 199.99, 10, 'Electronics'),
('Desk', 299.99, 5, 'Furniture'),
('Printer', 129.99, 8, 'Electronics'),
('Sofa', 499.99, 12, 'Furniture'),
('Bookshelf', 79.99, 15, 'Furniture');

-- Inserting records into the orders table
INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES
(1, 2, '2024-09-01'),
(2, 1, '2024-09-02'),
(3, 4, '2024-09-03'),
(4, 3, '2024-09-04'),
(5, 1, '2024-09-05');

-- Display tables
SELECT * FROM inventory;
SELECT * FROM orders;
SELECT DISTINCT category FROM inventory;
SELECT * FROM inventory
ORDER BY price DESC
LIMIT 5;
SELECT category, COUNT(*) AS product_count
FROM inventory
GROUP BY category;
SELECT name FROM inventory
WHERE quantity > 10;
SELECT SUM(price) AS total_price FROM inventory;
SELECT category, COUNT(*) AS product_count
FROM inventory
GROUP BY category;
SELECT name, price
FROM inventory
WHERE quantity = 0;
CREATE VIEW expensive_products AS
SELECT *
FROM inventory
WHERE price > (SELECT AVG(price) FROM inventory);
SELECT i.name AS product_name, o.quantity_ordered
FROM inventory i
JOIN orders o ON i.product_id = o.product_id;


