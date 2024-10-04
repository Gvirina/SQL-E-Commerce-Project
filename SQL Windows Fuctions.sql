SELECT customer_id, order_id, order_date, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS purchase_sequence
FROM ECommerceStore.Orders;

SELECT
order_id,
customer_id,
order_date,
total_amount,
LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date)
FROM ECommerceStore.orders;

SELECT
order_id,
customer_id,
order_date,
total_amount,
LEAD(total_amount) OVER (PARTITION By customer_id ORDER BY order_date)
FROM ECommerceStore.orders;

SELECT customer_id, SUM(total_amount) AS total_spent,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS spending_rank
FROM ECommerceStore.orders
GROUP BY customer_id;

SELECT customer_id, SUM(total_amount) AS total_spent,
DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS spending_dense_rank
FROM ECommerceStore.orders
GROUP BY customer_id;
