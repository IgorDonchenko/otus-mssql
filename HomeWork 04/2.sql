-- 2. �������� ������ � ����������� ����� (�����������), 2 �������� ����������.

-- �� ������ �������, ��� ��� �������� ����������.. ���� ��� �� ��� - ������� ��������
SELECT si.StockItemID, 
       si.StockItemName
FROM Warehouse.StockItems si
WHERE si.UnitPrice =
(
    SELECT TOP 1 si2.UnitPrice
    FROM Warehouse.StockItems si2
    ORDER BY si2.UnitPrice ASC
);

WITH MinPrice
AS (SELECT TOP 1 si.UnitPrice
    FROM Warehouse.StockItems si
    ORDER BY si.UnitPrice ASC)
SELECT si.StockItemID, 
    si.StockItemName
FROM Warehouse.StockItems si
WHERE si.UnitPrice = (
    SELECT mp.UnitPrice
    FROM MinPrice mp
);