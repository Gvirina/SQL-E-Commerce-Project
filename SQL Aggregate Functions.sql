USE EcommerceStore;
SELECT COUNT(*) AS total_count FROM products;

SELECT SUM(total_amount) AS total_revenue
FROM orders;

SELECT AVG(price) AS average_price
FROM products;

SELECT MAX(price) AS highest_price
FROM products;

SELECT MIN(price) AS lowest_price
FROM products;

SELECT status, count(*) AS order_count
FROM orders
GROUP BY status;

SELECT product_id, SUM(quantity * price) AS order_count
FROM orders
GROUP BY status;

USE EcommerceStore;

SELECT product_id, SUM(quantity) AS total_quantity_ordered
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > 2;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;

SELECT product_id, stock_quantity
FROM products
WHERE stock_quantity > (SELECT AVG(stock_quantity) FROM products);

SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT customer_id, AVG(total_amount) AS average_order_value
FROM orders
GROUP BY customer_id;


SELECT product_id, MAX(price) AS highest_price
FROM order_items
GROUP BY product_id
ORDER BY highest_price DESC
LIMIT 3;

SELECT customer_id, COUNT(DISTINCT product_id) AS distinct_products_ordered
FROM order_items
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY customer_id;




