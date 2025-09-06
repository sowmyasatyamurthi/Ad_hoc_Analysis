 select
CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then CONCAT('Q1 ' ,MONTHNAME(date))  
    WHEN date BETWEEN '2019-12-01' AND '2020-02-01' then CONCAT('Q2 ',MONTHNAME(date))
    WHEN date BETWEEN '2020-03-01' AND '2020-05-01' then CONCAT('Q3 ',MONTHNAME(date))
    WHEN date BETWEEN '2020-06-01' AND '2020-08-01' then CONCAT('Q4 ',MONTHNAME(date))
    END AS Quarters,
 sum(sold_quantity)
 FROM gross_sales
 where fiscal_year = 2020
 group by Quarters