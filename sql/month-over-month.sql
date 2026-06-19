-- Portfolio Query: Month-over-Month Performance metrics
WITH MonthlyMetrics AS (
    SELECT 
        DATE_TRUNC('month', invoice_date) AS sales_month,
        SUM(revenue) AS total_revenue,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT invoice) AS total_orders
    FROM v_clean_ecommerce_data
    GROUP BY 1
)
SELECT 
    sales_month,
    ROUND(total_revenue, 2) AS current_month_revenue,
    ROUND(LAG(total_revenue, 1) OVER (ORDER BY sales_month), 2) AS prev_month_revenue,
    ROUND(((total_revenue - LAG(total_revenue, 1) OVER (ORDER BY sales_month)) 
            / LAG(total_revenue, 1) OVER (ORDER BY sales_month)) * 100, 2) AS mom_growth_pct,
    ROUND(total_profit, 2) AS total_profit
FROM MonthlyMetrics
ORDER BY sales_month;