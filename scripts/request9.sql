/* Which channel helped to bring more gross sales in the fiscal year 2021 
   and the percentage of contribution? */

WITH cte1 AS (
    SELECT
        c.channel, 
        ROUND(SUM(gp.gross_price * fs.sold_quantity)/1000000, 2) AS gross_sales_mln
    FROM fact_sales_monthly fs 
    JOIN fact_gross_price gp
        ON gp.product_code = fs.product_code 
       AND gp.fiscal_year = fs.fiscal_year
    JOIN dim_customer c
        ON c.customer_code = fs.customer_code
    WHERE fs.fiscal_year = 2021
    GROUP BY c.channel
),
cte2 AS (
    SELECT 
        channel,
        gross_sales_mln,
        ROUND((gross_sales_mln * 100.0) / SUM(gross_sales_mln) OVER (), 2) AS percentage
    FROM cte1
)
SELECT 
    channel,
    gross_sales_mln,
    CONCAT(percentage, ' %') AS percentage
FROM cte2
ORDER BY gross_sales_mln DESC;
