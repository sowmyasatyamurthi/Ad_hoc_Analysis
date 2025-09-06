/* Get the complete report of the Gross sales amount for the customer 
“Atliq Exclusive” for each month . This analysis helps to get an idea 
of low and high-performing months and take strategic decisions. 
The final report contains these columns: Month Year Gross sales Amount  */

select
	CONCAT(MONTHNAME(FS.date), ' (', YEAR(FS.date), ')') AS 'Month', 
    fs.fiscal_year,
    round(sum((gp.gross_price * fs.sold_quantity)),2) as gross_sales_amount
from fact_sales_monthly fs 
join fact_gross_price gp
on gp.product_code =fs.product_code and gp.fiscal_year = fs.fiscal_year
join dim_customer c
on c.customer_code =fs.customer_code
where customer = 'Atliq Exclusive'
group by month, fs.fiscal_year
ORDER BY FS.fiscal_year ;