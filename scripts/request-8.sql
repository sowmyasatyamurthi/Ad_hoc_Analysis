/* In which quarter of 2020, got the maximum total_sold_quantity? 
The final output contains these fields sorted by the total_sold_quantity,
 Quarter total_sold_quantity  */
 
SELECT 
CASE
    WHEN month(date) IN (9,10,11) then 'Q1'  
	WHEN month(date) IN (12,1,2) then 'Q2' 
	WHEN month(date) IN (3,4,5)then 'Q3' 
    ELSE 'Q4' 
    END AS Quarters,
 sum(sold_quantity) as total_sold_quantity
 FROM gross_sales
 where fiscal_year = 2020
 group by Quarters