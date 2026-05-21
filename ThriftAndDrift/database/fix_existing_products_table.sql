USE thriftanddrift;

-- Run this once only if your existing products table was created by the old schema.
ALTER TABLE products CHANGE id product_id INT AUTO_INCREMENT;
ALTER TABLE products ADD COLUMN user_id INT NOT NULL DEFAULT 0;
ALTER TABLE products ADD COLUMN description TEXT;
ALTER TABLE products ADD COLUMN condition_rating INT DEFAULT 3;
ALTER TABLE products ADD COLUMN image VARCHAR(255);
ALTER TABLE products ADD COLUMN submission_id INT;
ALTER TABLE seller_submissions ADD COLUMN image VARCHAR(255);

UPDATE products
SET condition_rating = CASE
    WHEN item_condition = 'Like New' THEN 5
    WHEN item_condition = 'Good' THEN 4
    ELSE 3
END
WHERE condition_rating IS NULL OR condition_rating = 3;

UPDATE products
SET image = image_url
WHERE (image IS NULL OR image = '')
  AND image_url IS NOT NULL
  AND image_url <> '';

UPDATE products
SET status = 'available'
WHERE status = 'Listed';
