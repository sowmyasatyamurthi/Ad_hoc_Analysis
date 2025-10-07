CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_n_products_per_division_by_qty_sold`(
	in_fiscal_year int,
    in_top_n int
)
BEGIN
	   with cte1 as (
		   SELECT  
				p.division,
				p.product,
				sum(sold_quantity) as total_qty
			  
			FROM
				fact_sales_monthly S
				JOIN dim_product p ON s.product_code =p.product_code
				WHERE fiscal_year = in_fiscal_year
				group by p.product),
			
	  cte2 as( select
			* ,
			dense_rank() over(partition by division order by total_qty desc) as drnk
			from cte1)
			
	  select * from cte2 where drnk <=in_top_n;      
END