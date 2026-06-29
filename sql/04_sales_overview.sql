--Total KPIs

SELECT
    ROUND(SUM(revenue),2) AS total_revenue,
    ROUND(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT invoice) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(AVG(revenue),2) AS avg_transaction_value
FROM v_clean_ecommerce_data;

--Monthly Revenue

SELECT
    DATE_TRUNC('month',invoice_date) AS sales_month,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(profit),2) AS profit
FROM v_clean_ecommerce_data
GROUP BY 1
ORDER BY 1;

--Running Totals

SELECT
    DATE_TRUNC('month', invoice_date) AS sales_month,
    SUM(revenue) AS revenue,
    SUM(SUM(revenue))
        OVER (
            ORDER BY DATE_TRUNC('month', invoice_date)
        ) AS running_total
FROM v_clean_ecommerce_data
GROUP BY 1
ORDER BY 1;