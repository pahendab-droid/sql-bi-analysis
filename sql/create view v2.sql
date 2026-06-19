CREATE VIEW v_clean_ecommerce_data AS 
SELECT 
    invoice,
    stockcode,
    description,
    CAST(quantity AS INT) AS quantity,
    CAST(invoicedate AS TIMESTAMP) AS invoice_date,
    price,
    CAST(customer_id AS INT) AS customer_id,
    country,
    CAST(customer_age AS INT) AS customer_age,
    gender,
    CAST(signup_date AS TIMESTAMP) AS signup_date,
    CAST(last_login_date AS TIMESTAMP) AS last_login_date,
    customer_segment,
    marketing_channel,
    category,
    subcategory,
    cost,
    discount_applied,
    payment_method,
    CAST(promo_applied AS INT) AS promo_applied,
    CAST(delivery_time_days AS INT) AS delivery_time_days,
    revenue,
    profit,
    CAST(churn_flag AS INT) AS churn_flag 
FROM sales_data 
WHERE invoice IS NOT NULL 
  AND customer_id IS NOT NULL;