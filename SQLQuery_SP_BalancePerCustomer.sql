CREATE OR ALTER PROCEDURE BlanacePerCustomer
	@name VARCHAR (100)
AS
BEGIN
	SELECT
	DC.CustomerName,
	DA.AccountType,
	DA.Balance,
	DA.Balance 
		+ COALESCE (SUM(CASE WHEN FT.TransactionType = 'Deposit' THEN FT.Amount ELSE 0 END), 0)
		- COALESCE (SUM(CASE WHEN FT.TransactionType != 'Deposit' THEN FT.Amount ELSE 0 END), 0) AS CurrentBalance
	FROM DimCustomer AS DC
	INNER JOIN DimAccount AS DA
	ON DC.CustomerId = DA.CustomerId
	LEFT JOIN FactTransaction AS FT
	ON DA.AccountId = FT.AccountId
	WHERE DC.CustomerName LIKE @name+'%' AND DA.Status = 'active'
	GROUP BY DC.CustomerName, DA.AccountType, DA.Balance;
END;

EXEC BlanacePerCustomer @name = 'Shelly'