/* switch case */

USE exdb;
SELECT * FROM orderdetail;

	SELECT orderID, Quantity, 'quantity  없음 30' AS quantityText
		FROM orderdetail;

SELECT orderID, Quantity,
case when quantity > 30 then '30이상'
	  when quantity = 30 then '30'
	  ELSE '30이하'
	END AS 수량범위
	FROM orderdetail;
	

SELECT CustomerName, City, Country
FROM customers
ORDER BY
(case
	when city IS NULL then country
	ELSE city
end);
