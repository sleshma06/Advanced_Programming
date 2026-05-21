CREATE DATABASE IF NOT EXISTS thriftanddrift;
USE thriftanddrift;

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
);

-- Default admin login for local setup:
-- Email: admin@gmail.com
-- Password: 123456
INSERT INTO users (name, email, password, role)
SELECT 'Admin', 'admin@gmail.com',
       '$2a$10$d7KVukexRU/x/Oa6XpInd.bJuhubC3nMGyD26TEXwFvghVREcJprK',
       'admin'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'admin@gmail.com'
);

-- To make another existing account an admin, register normally from the website,
-- then run this after changing the email:
-- UPDATE users SET role = 'admin' WHERE email = 'your-email@example.com';
