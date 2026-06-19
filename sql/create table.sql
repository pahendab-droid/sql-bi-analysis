DROP TABLE IF EXISTS sales_data CASCADE;

CREATE TABLE sales_data (
    invoice VARCHAR(100),
    stock_code VARCHAR(100),
    description VARCHAR(255),
    quantity NUMERIC,           -- Changed to NUMERIC to handle any hidden ".0"
    invoice_date VARCHAR(100), 
    price NUMERIC(12, 4),
    customer_id NUMERIC,       
    country VARCHAR(100),
    customer_age NUMERIC,       -- Changed to NUMERIC to handle "26.0" flawlessly
    gender VARCHAR(50),
    signup_date VARCHAR(100),
    last_login_date VARCHAR(100),
    customer_segment VARCHAR(100),
    marketing_channel VARCHAR(100),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    cost NUMERIC(12, 4),
    discount_amount NUMERIC(12, 4),
    payment_method VARCHAR(100),
    promo_applied NUMERIC,      -- Changed to NUMERIC to handle "0.0" or "1.0"
    delivery_time_days NUMERIC, -- Changed to NUMERIC for safety
    revenue NUMERIC(12, 4),
    profit NUMERIC(12, 4),
    churn_flag NUMERIC          -- Changed to NUMERIC to handle "0.0" or "1.0"
);