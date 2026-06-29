-- Revenue by channel

SELECT
    marketing_channel,
    COUNT(DISTINCT customer_id) customers,
    ROUND(SUM(revenue),2) revenue,
    ROUND(SUM(profit),2) profit
FROM v_clean_ecommerce_data
GROUP BY marketing_channel
ORDER BY revenue DESC;

-- Profit by channel

SELECT
    marketing_channel,
    ROUND(SUM(profit),2) AS total_profit
FROM v_clean_ecommerce_data
GROUP BY marketing_channel
ORDER BY total_profit DESC;
