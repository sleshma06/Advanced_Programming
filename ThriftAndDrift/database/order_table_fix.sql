USE thriftanddrift;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) DEFAULT 0,
    order_status VARCHAR(50) DEFAULT 'Processing',
    payment_method VARCHAR(50),
    delivery_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT 'Orders table is ready.' AS message;
