-- Seed data covering multiple signup cohorts and repeat transactions
INSERT INTO users (user_id, email, created_at) VALUES
(1, 'alice@example.com', '2024-01-10 10:00:00'),
(2, 'bob@example.com',   '2024-01-15 11:30:00'),
(3, 'charlie@example.com', '2024-02-01 09:15:00'),
(4, 'david@example.com', '2024-02-12 14:20:00'),
(5, 'eve@example.com',   '2024-03-05 16:45:00');

INSERT INTO products (product_id, name, category, price) VALUES
(101, 'Mechanical Keyboard', 'Electronics', 120.00),
(102, 'Ergonomic Mouse',    'Electronics',  50.00),
(103, 'Desk Mat',            'Accessories',  25.00),
(104, 'USB-C Hub',           'Electronics',  40.00);

INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(1001, 1, '2024-01-10 10:30:00', 120.00),
(1002, 1, '2024-02-14 11:00:00',  50.00),
(1003, 1, '2024-03-10 15:00:00',  25.00),
(1004, 2, '2024-01-16 12:00:00', 170.00),
(1005, 3, '2024-02-01 10:00:00',  25.00),
(1006, 3, '2024-03-20 16:30:00', 120.00),
(1007, 4, '2024-02-12 15:00:00',  40.00),
(1008, 5, '2024-03-05 17:00:00',  90.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 1, 120.00),
(2, 1002, 102, 1,  50.00),
(3, 1003, 103, 1,  25.00),
(4, 1004, 101, 1, 120.00),
(5, 1004, 102, 1,  50.00),
(6, 1005, 103, 1,  25.00),
(7, 1006, 101, 1, 120.00),
(8, 1007, 104, 1,  40.00),
(9, 1008, 102, 1,  50.00),
(10, 1008, 104, 1, 40.00);
