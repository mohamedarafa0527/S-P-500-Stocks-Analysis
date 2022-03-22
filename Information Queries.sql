





------------ Query (1) -------------------------------------


SELECT GICS_Sub_Industry, SUM (Market_Cap) / AVG (Price) AS TOTAL_NO_OF_STOCKS
FROM COMPANY_DIM COM, YEARLY_AVERAGE_MEASURMENT_FACT YEARLY
WHERE COM.SYMBOL = YEARLY.SYMBOL
GROUP BY GICS_Sub_Industry
ORDER  BY TOTAL_NO_OF_STOCKS DESC;



------------ Query (2) -------------------------------------

-- Average of close prices in certain date 

SELECT DAY_DATE, AVG(CLOSE_PRICE)
FROM DAILY_STOCKS_DATA_FACT
GROUP BY DAY_DATE;






------------ Query (3) -------------------------------------

SELECT SYMBOL, AVG(VOLUME), SUM(VOLUME)
FROM DAILY_STOCKS_DATA_FACT
GROUP BY SYMBOL
ORDER BY AVG(VOLUME) ;


------------ Query (4) -------------------------------------


SELECT GICS_Sector, AVG (OPEN_PRICE) ,AVG(CLOSE_PRICE), AVG (HIGH_PRICE), AVG (LOW_PRICE), AVG (VOLUME)
FROM COMPANY_DIM COM, DAILY_STOCKS_DATA_FACT DAILY
WHERE COM.SYMBOL = DAILY.SYMBOL
GROUP BY GICS_Sector
ORDER  BY AVG(CLOSE_PRICE) DESC;




------------ Query (5) -------------------------------------


SELECT GICS_Sub_Industry, SUM (EBITDA) ,SUM (Dividend_Yield),AVG(Earnings_Per_Share) ,AVG (Price_Per_Book)
FROM COMPANY_DIM COM, YEARLY_AVERAGE_MEASURMENT_FACT YEARLY
WHERE COM.SYMBOL = YEARLY.SYMBOL
GROUP BY GICS_Sub_Industry
ORDER  BY SUM (Dividend_Yield) DESC;


------------ Query (6) -------------------------------------

SELECT  AVG(General_Stock_Value)
FROM Performance_General_Stock_Fact
GROUP BY DAILY_DATE 
ORDER BY AVG(General_Stock_Value) DESC ;