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
    user_id INT NOT NULL,
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

CREATE TABLE IF NOT EXISTS wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_user_product (user_id, product_id)
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
-- ALTER TABLE products ADD COLUMN user_id INT NOT NULL;
-- ALTER TABLE products ADD COLUMN item_condition VARCHAR(50);
-- ALTER TABLE products ADD COLUMN image_url VARCHAR(255);
-- ALTER TABLE products ADD COLUMN submission_id INT;
-- ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2) DEFAULT 0;
-- ALTER TABLE orders ADD COLUMN order_status VARCHAR(50) DEFAULT 'Processing';
-- ALTER TABLE orders ADD COLUMN payment_method VARCHAR(50);
-- ALTER TABLE orders ADD COLUMN delivery_type VARCHAR(50);

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Polka-dot Skirt', 'Skirts', 'Like New', 'L', 750.00, 'Listed', 'images/polkadot.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products);

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Short Jean Skirt', 'Skirts', 'Good', 'M', 290.00, 'Listed', 'images/c3.jfif'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Short Jean Skirt');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Denim Midi Skirt', 'Skirts', 'Good', 'M', 300.00, 'Listed', 'images/c4.jfif'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Denim Midi Skirt');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Lace Crochet Top', 'Tops', 'Like New', 'S', 340.00, 'Listed', 'images/shirt.png'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Lace Crochet Top');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Striped Peasant Blouse', 'Tops', 'Fair', 'M', 270.00, 'Listed', 'images/allison-christine-wV7UfVeI84w-unsplash.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Striped Peasant Blouse');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Camel Wool Trench Coat', 'Outerwear', 'Good', 'L', 1850.00, 'Listed', 'images/PradaCoat.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Camel Wool Trench Coat');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Denim Oversized Jacket', 'Outerwear', 'Like New', 'XL', 990.00, 'Listed', 'images/denim.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Denim Oversized Jacket');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Ditsy Floral Sundress', 'Dresses', 'Like New', 'S', 680.00, 'Listed', 'images/ContactUs.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Ditsy Floral Sundress');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Flared Cotton Skirt', 'Skirts', 'Good', 'S', 456.00, 'Listed', 'images/c2.jfif'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Flared Cotton Skirt');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Wrinkled Satin Skirt', 'Skirts', 'Like New', 'L', 500.00, 'Listed', 'images/c1.jfif'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wrinkled Satin Skirt');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Puff Sleeve Corset Top', 'Tops', 'Good', 'M', 490.00, 'Listed', 'images/DiorEmb.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Puff Sleeve Corset Top');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Embroidered Boho Top', 'Tops', 'Like New', 'L', 415.00, 'Listed', 'images/gucci.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Embroidered Boho Top');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Corduroy Blazer', 'Outerwear', 'Fair', 'M', 1200.00, 'Listed', 'images/clothesCloset.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Corduroy Blazer');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Knit Cardigan Coat', 'Outerwear', 'Good', 'L', 760.00, 'Listed', 'images/hanger.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Knit Cardigan Coat');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Straight-leg Cotton Pants', 'Pants', 'Good', 'M', 620.00, 'Listed', 'images/comp.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Straight-leg Cotton Pants');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Wide-leg Linen Pants', 'Pants', 'Like New', 'L', 700.00, 'Listed', 'images/registration.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wide-leg Linen Pants');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Black Tailored Pants', 'Pants', 'Good', 'M', 840.00, 'Listed', 'images/ourStory.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Black Tailored Pants');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Slip Satin Maxi Dress', 'Dresses', 'Good', 'M', 890.00, 'Listed', 'images/PradaCoat.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Slip Satin Maxi Dress');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Smocked Prairie Dress', 'Dresses', 'Like New', 'L', 750.00, 'Listed', 'images/polkadot.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smocked Prairie Dress');

INSERT INTO products (name, category, item_condition, size, price, status, image_url)
SELECT 'Classic Black Midi Dress', 'Dresses', 'Good', 'M', 950.00, 'Listed', 'images/DiorEmb.jpg'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Classic Black Midi Dress');
