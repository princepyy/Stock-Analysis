-- Create Database
CREATE DATABASE IF NOT EXISTS stock_analyzer_db;
USE stock_analyzer_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'USER'
);

-- Stocks Table
CREATE TABLE IF NOT EXISTS stocks (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    current_price DECIMAL(10, 2),
    daily_change DECIMAL(5, 2),
    sector VARCHAR(50),
    listing_date DATE
);

-- Portfolio Table
CREATE TABLE IF NOT EXISTS portfolio (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    stock_id BIGINT,
    quantity INT,
    avg_buy_price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (stock_id) REFERENCES stocks(id)
);

-- Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    stock_id BIGINT,
    type VARCHAR(10),
    quantity INT,
    price DECIMAL(10, 2),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (stock_id) REFERENCES stocks(id)
);

-- Watchlist Table
CREATE TABLE IF NOT EXISTS watchlist (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    stock_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (stock_id) REFERENCES stocks(id)
);

-- Initial Seed Data (Optional, Application also has DataSeeder)
INSERT INTO stocks (symbol, name, current_price, daily_change, sector, listing_date) VALUES 
('AAPL', 'Apple Inc.', 175.50, 1.25, 'Technology', '1980-12-12'),
('GOOGL', 'Alphabet Inc.', 140.20, -0.45, 'Technology', '2004-08-19'),
('AMZN', 'Amazon.com', 178.15, 2.10, 'Consumer Discretionary', '1997-05-15'),
('MSFT', 'Microsoft Corp.', 415.30, 0.85, 'Technology', '1986-03-13'),
('TSLA', 'Tesla Inc.', 202.60, -1.50, 'Consumer Discretionary', '2010-06-29');
