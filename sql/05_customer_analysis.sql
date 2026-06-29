 -- Top customers

SELECT
    customer_id,
    ROUND(SUM(revenue),2) AS customer_revenue
FROM v_clean_ecommerce_data
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 10;

-- Customer segments

SELECT
    customer_segment,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM v_clean_ecommerce_data
GROUP BY customer_segment
ORDER BY revenue DESC;

-- Average customer age

SELECT
    ROUND(AVG(customer_age),1)
FROM v_clean_ecommerce_data;

-- Gender breakdown??

SELECT
    ROUND(AVG(customer_age),1) AS avg_customer_age
FROM v_clean_ecommerce_data;

-- Rank customers by revenue

SELECT
    customer_id,
    ROUND(SUM(revenue),2) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(revenue) DESC
    ) AS customer_rank
FROM v_clean_ecommerce_data
GROUP BY customer_id;

