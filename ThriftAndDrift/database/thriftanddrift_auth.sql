CREATE DATABASE IF NOT EXISTS thriftanddrift;
USE thriftanddrift;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
);

-- To create an admin:
-- 1. Register normally from the website.
-- 2. Then run this after changing the email to your admin email:
-- UPDATE users SET role = 'admin' WHERE email = 'admin@example.com';
