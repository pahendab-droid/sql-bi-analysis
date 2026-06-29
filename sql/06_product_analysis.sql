-- Revenue by category

SELECT
    category,
    ROUND(SUM(revenue),2) revenue
FROM v_clean_ecommerce_data
GROUP BY category
ORDER BY revenue DESC;

-- Revenue by subcategory

SELECT
    subcategory,
    ROUND(SUM(revenue),2) revenue,
    ROUND(SUM(profit),2) profit
FROM v_clean_ecommerce_data
GROUP BY subcategory
ORDER BY revenue DESC;

  -- Most profitable products

SELECT
    description,
    ROUND(SUM(profit),2) total_profit
FROM v_clean_ecommerce_data
GROUP BY description
ORDER BY total_profit DESC
LIMIT 20;

--Top products by revenue

SELECT
    description,
    ROUND(SUM(revenue),2) AS total_revenue
FROM v_clean_ecommerce_data
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 20;

--Product ranking

SELECT
    description,
    ROUND(SUM(revenue),2) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(revenue) DESC
    ) AS product_rank
FROM v_clean_ecommerce_data
GROUP BY description
ORDER BY product_rank;

