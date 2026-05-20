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
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    size VARCHAR(50),
    price DECIMAL(10,2),
    description TEXT,
    condition_rating INT DEFAULT 3,
    image VARCHAR(255),
    status VARCHAR(50) DEFAULT 'available',
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
-- ALTER TABLE products CHANGE id product_id INT AUTO_INCREMENT;
-- ALTER TABLE products ADD COLUMN user_id INT NOT NULL;
-- ALTER TABLE products ADD COLUMN description TEXT;
-- ALTER TABLE products ADD COLUMN condition_rating INT DEFAULT 3;
-- ALTER TABLE products ADD COLUMN image VARCHAR(255);
-- ALTER TABLE products ADD COLUMN submission_id INT;
-- ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2) DEFAULT 0;
-- ALTER TABLE orders ADD COLUMN order_status VARCHAR(50) DEFAULT 'Processing';
-- ALTER TABLE orders ADD COLUMN payment_method VARCHAR(50);
-- ALTER TABLE orders ADD COLUMN delivery_type VARCHAR(50);

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Polka-dot Skirt', 'Skirts', 'L', 750.00,
       'A graceful polka-dot skirt with a light vintage feel, perfect for brunch, college days, or a soft formal look.',
       5, 'images/polkadot.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Polka-dot Skirt');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Short Jean Skirt', 'Skirts', 'M', 290.00,
       'A casual denim mini skirt with a clean waistline and easy everyday styling for warm days.',
       4, 'images/c3.jfif', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Short Jean Skirt');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Denim Midi Skirt', 'Skirts', 'M', 300.00,
       'A versatile midi skirt with a structured denim look that pairs well with fitted tees and oversized shirts.',
       4, 'images/c4.jfif', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Denim Midi Skirt');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Flared Cotton Skirt', 'Skirts', 'S', 456.00,
       'A soft flared skirt with comfortable movement and a simple shape for relaxed daily outfits.',
       4, 'images/c2.jfif', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Flared Cotton Skirt');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Wrinkled Satin Skirt', 'Skirts', 'L', 500.00,
       'A satin skirt with a subtle textured finish, made for dressier evenings while staying comfortable.',
       5, 'images/c1.jfif', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wrinkled Satin Skirt');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Lace Crochet Top', 'Tops', 'S', 340.00,
       'A delicate crochet-inspired top that works beautifully with denim, skirts, or layered styling.',
       5, 'images/shirt.png', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Lace Crochet Top');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Striped Peasant Blouse', 'Tops', 'M', 270.00,
       'A relaxed blouse with a breezy silhouette for casual days and soft layered looks.',
       3, 'images/allison-christine-wV7UfVeI84w-unsplash.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Striped Peasant Blouse');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Puff Sleeve Corset Top', 'Tops', 'M', 490.00,
       'A statement top with puff sleeves and a shaped bodice, ideal for party styling or elevated casual wear.',
       4, 'images/DiorEmb.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Puff Sleeve Corset Top');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Embroidered Boho Top', 'Tops', 'L', 415.00,
       'A detailed boho-style top with embroidery accents and a premium thrifted feel.',
       5, 'images/gucci.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Embroidered Boho Top');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Camel Wool Trench Coat', 'Outerwear', 'L', 1850.00,
       'A polished camel trench coat with a warm tone and timeless shape for cooler days.',
       4, 'images/PradaCoat.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Camel Wool Trench Coat');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Denim Oversized Jacket', 'Outerwear', 'XL', 990.00,
       'An oversized denim jacket with easy layering room and a dependable streetwear feel.',
       5, 'images/denim.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Denim Oversized Jacket');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Corduroy Blazer', 'Outerwear', 'M', 1200.00,
       'A textured blazer with character, great for semi-formal outfits and vintage-inspired layering.',
       3, 'images/clothesCloset.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Corduroy Blazer');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Knit Cardigan Coat', 'Outerwear', 'L', 760.00,
       'A cozy cardigan coat with soft structure, made for transitional weather and relaxed outfits.',
       4, 'images/hanger.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Knit Cardigan Coat');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Straight-leg Cotton Pants', 'Pants', 'M', 620.00,
       'Comfortable straight-leg pants with a neat everyday fit and easy neutral styling.',
       4, 'images/comp.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Straight-leg Cotton Pants');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Wide-leg Linen Pants', 'Pants', 'L', 700.00,
       'Airy wide-leg pants for a clean, relaxed silhouette that works from errands to coffee dates.',
       5, 'images/registration.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Wide-leg Linen Pants');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Black Tailored Pants', 'Pants', 'M', 840.00,
       'A smart pair of tailored black pants for office looks, presentations, and evening styling.',
       4, 'images/ourStory.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Black Tailored Pants');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Ditsy Floral Sundress', 'Dresses', 'S', 680.00,
       'A sweet floral sundress with a light shape and easy charm for sunny days.',
       5, 'images/ContactUs.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Ditsy Floral Sundress');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Slip Satin Maxi Dress', 'Dresses', 'M', 890.00,
       'A smooth satin maxi dress with a simple drape, suited for dinners and minimal occasion styling.',
       4, 'images/PradaCoat.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Slip Satin Maxi Dress');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Smocked Prairie Dress', 'Dresses', 'L', 750.00,
       'A prairie-style dress with soft smocking details and a romantic thrifted look.',
       5, 'images/polkadot.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Smocked Prairie Dress');

INSERT INTO products (user_id, name, category, size, price, description, condition_rating, image, status)
SELECT 0, 'Classic Black Midi Dress', 'Dresses', 'M', 950.00,
       'A clean black midi dress that can be styled up or down for reliable wardrobe mileage.',
       4, 'images/DiorEmb.jpg', 'available'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name = 'Classic Black Midi Dress');
