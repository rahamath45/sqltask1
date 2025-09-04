Retrieve all customers who have placed an order in the last 30 days
→ Finds customers who have made at least one order within the last 30 days.

Get the total amount of all orders placed by each customer
→ Shows the sum of order amounts for every customer (customer-wise total).

Update the price of Product C to 45.00
→ Changes the price of Product C to 45.00.

Add a new column discount to the products table
→ Adds a new column named discount in the products table to store discount values.

Retrieve the top 3 products with the highest price
→ Displays the three most expensive products.

Get the names of customers who have ordered Product A
→ Lists customers who have ordered Product A.

Join the orders and customers tables to retrieve the customer’s name and order date for each order
→ Combines customer and order data to show which customer placed an order and on which date.

Retrieve the orders with a total amount greater than 150.00
→ Displays only those orders where the total amount exceeds 150.00.

Normalize the database by creating a separate table for order items and updating the orders table to reference the order_items table
→ Database restructuring:

Create a new order_items table (order_id, product_id, quantity).

Remove product details directly stored in orders.

Link orders → order_items → products for proper normalization.

Retrieve the average total of all orders
→ Calculates the average (mean) total amount of all orders.
