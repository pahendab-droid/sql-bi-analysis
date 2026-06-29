-- Discount vs no discount

SELECT
    CASE
        WHEN discount_applied > 0 THEN 'Discount'
        ELSE 'No Discount'
    END AS discount_group,
    ROUND(AVG(revenue),2) avg_revenue,
    ROUND(AVG(profit),2) avg_profit
FROM v_clean_ecommerce_data
GROUP BY discount_group;
