CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
calendar_date date	
) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    Declare m tinyint;
    Declare qtr char(2);
    set m = Month(calendar_date);
    
    case
       when m in (9,10,11) then 
          set qtr = "Q1";
      when m in (12,1,2) then 
          set qtr = "Q2";
       when m in (3,4,5) then 
          set qtr = "Q3";
		else
         set qtr = "Q4";
   End case ;  
RETURN qtr;
END