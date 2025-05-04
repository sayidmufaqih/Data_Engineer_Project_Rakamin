CREATE OR ALTER PROCEDURE DailyTransaction
	@start_date DATETIME,
	@end_date DATETIME
AS
BEGIN
	SELECT 
	FORMAT(TransactionDate, 'yyyy-MM-dd') AS Date, 
	COUNT(TransactionId) AS TotalTransaction, 
	SUM(Amount) AS TotalAmount
	FROM FactTransaction
	WHERE FORMAT(TransactionDate, 'yyyy-MM-dd') BETWEEN @start_date AND @end_date
	GROUP BY FORMAT(TransactionDate, 'yyyy-MM-dd');
END;

EXEC DailyTransaction '2024-01-17','2024-01-20'

