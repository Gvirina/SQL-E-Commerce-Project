SELECT * 
FROM
ECommerceStore;

SELECT orders.order_id, products.name, order_items.quantity FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOiN products ON order_items.product_id = products.product_id;

SELECT customers.customer_id, customers.first_name, orders.order_id, orders.status
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT payment_details.payment_id, payment_details.order_id, payment_details.amount, payment_details.payment_date, payment_details.payment_method, orders.total_amount
FROM payment_details
RIGHT JOIN orders
ON payment_details.order_id = orders.order_id;

(SELECT name AS "item" FROM 
products)
UNION
(SELECT CONCAT(first_name, last_name) AS "name"
FROM customers);

SELECT 
    customers.customer_id,
    CONCAT(customers.first_name, ' ', customers.last_name) AS customer_full_name,
    orders.order_id,
    orders.total_amount
FROM 
    customers
JOIN 
    orders ON customers.customer_id = orders.customer_id
JOIN 
    order_items ON orders.order_id = order_items.order_id
JOIN 
    products ON order_items.product_id = products.product_id
WHERE 
    products.name = 'Headphones';
