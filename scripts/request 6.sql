/* Generate a report which contains the top 5 customers who received 
an average high pre_invoice_discount_pct for the fiscal year 2021 and 
in the Indian market. The final output contains these fields, 
customer_code customer average_discount_percentage */

SELECT 
c.customer_code ,
c.customer,
 ROUND(AVG(pre.pre_invoice_discount_pct) * 100, 2) AS average_discount_percentage
FROM fact_pre_invoice_deductions pre
join dim_customer c
on c.customer_code = pre.customer_code
where fiscal_year = 2021 and market = "india"
group by customer_code
order by average_discount_percentage desc
limit 5;

