/* 2 What is the percentage of unique product increase in 2021 vs. 2020? 
The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg  */


with cte1 as (
select 
	count(distinct(product_code)) as unique_products_2020
from fact_sales_monthly where fiscal_year = 2020
),

cte2 as (
select 
	count(distinct(product_code)) as unique_products_2021
from fact_sales_monthly where fiscal_year = 2021
)

select 
	cte1.unique_products_2020,
	cte2.unique_products_2021,
	ROUND((cte2.unique_products_2021 - cte1.unique_products_2020) * 100.0 /cte1.unique_products_2020, 2) AS percentage_chg
from cte1, cte2;