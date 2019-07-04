-- Temp table

CREATE TABLE #EmployeeReport (PersonId INT PRIMARY KEY, FullName NVARCHAR(MAX), OrdersCount INT);

INSERT INTO #EmployeeReport
SELECT p.PersonID, p.FullName, 0 FROM Application.People p
WHERE p.IsEmployee = 1;


UPDATE #EmployeeReport
SET
    #EmployeeReport.OrdersCount = (SELECT COUNT(o.OrderId) FROM Sales.Orders o WHERE o.SalespersonPersonID = #EmployeeReport.PersonId);

SELECT * FROM #EmployeeReport er;

DROP TABLE #EmployeeReport;


-- table variable
DECLARE @EmployeeReport TABLE (PersonId INT PRIMARY KEY, FullName NVARCHAR(MAX), OrdersCount INT);

INSERT INTO @EmployeeReport
SELECT p.PersonID, p.FullName, 0 FROM Application.People p
WHERE p.IsEmployee = 1;


UPDATE er
SET er.OrdersCount = (SELECT COUNT(o.OrderId) FROM Sales.Orders o WHERE o.SalespersonPersonID = er.PersonId)
FROM @EmployeeReport er;

SELECT * FROM @EmployeeReport er;


-- � ������ ������ ������� �������� Table Variable. 
-- ������ ����� ����������� ��������� ���������� ������. ��� � ����� �� ������ - �� 100 ������� - ����� table variable, ������ - temp table.