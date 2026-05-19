USE thriftanddrift;

CREATE TABLE IF NOT EXISTS seller_submissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    item_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    item_condition VARCHAR(50) NOT NULL,
    size VARCHAR(50),
    estimated_price DECIMAL(10,2),
    final_price DECIMAL(10,2),
    dropoff_location VARCHAR(255) DEFAULT 'Thrift&Drift Store, Kathmandu',
    dropoff_date DATE,
    dropoff_time_slot VARCHAR(50),
    payout_info VARCHAR(255),
    status VARCHAR(50) DEFAULT 'Submitted',
    admin_note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    item_condition VARCHAR(50),
    size VARCHAR(50),
    price DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'Listed',
    image_url VARCHAR(255),
    submission_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) DEFAULT 0,
    order_status VARCHAR(50) DEFAULT 'Processing',
    payment_method VARCHAR(50),
    delivery_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin_actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    submission_id INT,
    action VARCHAR(50) NOT NULL,
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- If your tables already existed, run these only if a column is missing.
-- ALTER TABLE products ADD COLUMN item_condition VARCHAR(50);
-- ALTER TABLE products ADD COLUMN image_url VARCHAR(255);
-- ALTER TABLE products ADD COLUMN submission_id INT;
-- ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2) DEFAULT 0;
-- ALTER TABLE orders ADD COLUMN order_status VARCHAR(50) DEFAULT 'Processing';
-- ALTER TABLE orders ADD COLUMN payment_method VARCHAR(50);
-- ALTER TABLE orders ADD COLUMN delivery_type VARCHAR(50);
