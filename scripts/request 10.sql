/*10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields, division product_code */


With cte1 as (
select 
	p.division,
    P.product_code,
	CONCAT(p.product, ' - ', p.variant) AS product_variant, 
    sum(sold_quantity) as Total_sold_quantity
from fact_sales_monthly fs
join dim_product p
on fs.product_code =p.product_code
where fiscal_year =2021
group by division, product_variant
),
cte2 as (
select *,
	dense_rank() over(partition by division order by Total_sold_quantity desc) as drnk
from cte1)

select * from cte2 where drnk in( 1, 2, 3);    