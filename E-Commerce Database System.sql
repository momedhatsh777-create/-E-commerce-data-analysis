


CREATE DATABASE Ecommerce_Project;
USE Ecommerce_Project


                      --CREATE TABLE IN DATEBASE--

-----------------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY ,
    FullName VARCHAR (100) ,
    Email VARCHAR (100) ,
    City VARCHAR (50),
    Country VARCHAR (50) ,
    SignupDate date 
    );


     SELECT *
FROM Customers;


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY ,
    categoryname VARCHAR (100) 
    );

     
    SELECT *
FROM categories;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,    
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    StockQuantity INT,
    CategoryID INT,
    
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
    );


    SELECT *
FROM Products;

CREATE TABLE Employees (   
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE
    );

    SELECT *
FROM Employees;


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID)
    );

     SELECT *
FROM Orders;

SELECT *
FROM INFORMATION_SCHEMA.TABLES;

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
    );


    SELECT *
FROM OrderDetails;


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    PaymentAmount DECIMAL(10,2),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
    );


    SELECT *
FROM Payments;



                        -- INSERT VALUES IN TABLE  --


---------------------------------------------------------------------------

INSERT INTO Categories
   VALUES
      (1, 'Electronics'),
      (2, 'Clothing'),
      (3, 'Books'),
      (4, 'Home Appliances');

select *
from categories;

----------------------------------------------------------------------------
insert into products
   values
      (101, 'laptop', 15000, 10, 1),
      (102, 'mouse', 300, 50, 1),
      (103, 'keybord', 700, 30, 1),
      (104, 't-shirt', 250, 100, 2),
      (105, 'jeans', 600, 40, 2),
      (106, 'python book', 450, 25, 3),
      (107, 'microwave', 3500, 15, 4),
      (108, 'air fryer', 5000, 12, 4);
 
DECLARE @i INT = 109;
WHILE @i <= 128
BEGIN
INSERT INTO Products
(ProductID,ProductName,Price,StockQuantity,CategoryID)
VALUES
(@i,
CONCAT('Product ', @i),
(ABS(CHECKSUM(NEWID())) % 9000) + 100,
(ABS(CHECKSUM(NEWID())) % 100) + 5,
(ABS(CHECKSUM(NEWID())) % 4) + 1
);
SET @i = @i + 1;
END;


UPDATE Products SET ProductName = 'Dell Laptop'            WHERE ProductID = 101;
UPDATE Products SET ProductName = 'Wireless Mouse'         WHERE ProductID = 102;
UPDATE Products SET ProductName = 'Mechanical Keyboard'    WHERE ProductID = 103;
UPDATE Products SET ProductName = 'Cotton T-Shirt'         WHERE ProductID = 104;
UPDATE Products SET ProductName = 'Blue Jeans'             WHERE ProductID = 105;
UPDATE Products SET ProductName = 'Python Programming'     WHERE ProductID = 106;
UPDATE Products SET ProductName = 'Microwave Oven'         WHERE ProductID = 107;
UPDATE Products SET ProductName = 'Air Fryer'              WHERE ProductID = 108;

UPDATE Products SET ProductName = 'HP Laptop'              WHERE ProductID = 109;
UPDATE Products SET ProductName = 'Lenovo Laptop'          WHERE ProductID = 110;
UPDATE Products SET ProductName = 'Gaming Mouse'           WHERE ProductID = 111;
UPDATE Products SET ProductName = 'Gaming Keyboard'        WHERE ProductID = 112;
UPDATE Products SET ProductName = '24 Inch Monitor'        WHERE ProductID = 113;
UPDATE Products SET ProductName = 'Webcam HD'              WHERE ProductID = 114;
UPDATE Products SET ProductName = 'USB Flash 64GB'         WHERE ProductID = 115;
UPDATE Products SET ProductName = 'SSD 1TB'                WHERE ProductID = 116;
UPDATE Products SET ProductName = 'Bluetooth Speaker'      WHERE ProductID = 117;
UPDATE Products SET ProductName = 'Smart Watch'            WHERE ProductID = 118;
UPDATE Products SET ProductName = 'Power Bank'             WHERE ProductID = 119;
UPDATE Products SET ProductName = 'WiFi Router'            WHERE ProductID = 120;

UPDATE Products SET ProductName = 'Black Hoodie'           WHERE ProductID = 121;
UPDATE Products SET ProductName = 'White Shirt'            WHERE ProductID = 122;
UPDATE Products SET ProductName = 'Running Shoes'          WHERE ProductID = 123;
UPDATE Products SET ProductName = 'Leather Belt'           WHERE ProductID = 124;
UPDATE Products SET ProductName = 'Baseball Cap'           WHERE ProductID = 125;
UPDATE Products SET ProductName = 'Sports Shorts'          WHERE ProductID = 126;
UPDATE Products SET ProductName = 'Winter Jacket'          WHERE ProductID = 127;
UPDATE Products SET ProductName = 'Cotton Socks'           WHERE ProductID = 128;

UPDATE Products SET ProductName = 'SQL Fundamentals'       WHERE ProductID = 129;
UPDATE Products SET ProductName = 'Power BI Guide'         WHERE ProductID = 130;
UPDATE Products SET ProductName = 'Excel Analytics'        WHERE ProductID = 131;
UPDATE Products SET ProductName = 'Statistics Basics'      WHERE ProductID = 132;
UPDATE Products SET ProductName = 'Machine Learning'       WHERE ProductID = 133;
UPDATE Products SET ProductName = 'Data Science Handbook'  WHERE ProductID = 134;
UPDATE Products SET ProductName = 'Business Analytics'     WHERE ProductID = 135;
UPDATE Products SET ProductName = 'Deep Learning'          WHERE ProductID = 136;
UPDATE Products SET ProductName = 'Artificial Intelligence'WHERE ProductID = 137;
UPDATE Products SET ProductName = 'Database Design'        WHERE ProductID = 138;

UPDATE Products SET ProductName = 'Vacuum Cleaner'         WHERE ProductID = 139;
UPDATE Products SET ProductName = 'Blender'                WHERE ProductID = 140;
UPDATE Products SET ProductName = 'Coffee Maker'           WHERE ProductID = 141;
UPDATE Products SET ProductName = 'Electric Kettle'        WHERE ProductID = 142;
UPDATE Products SET ProductName = 'Rice Cooker'            WHERE ProductID = 143;
UPDATE Products SET ProductName = 'Water Heater'           WHERE ProductID = 144;
UPDATE Products SET ProductName = 'Toaster'                WHERE ProductID = 145;
UPDATE Products SET ProductName = 'Ceiling Fan'            WHERE ProductID = 146;
UPDATE Products SET ProductName = 'Refrigerator'           WHERE ProductID = 147;
UPDATE Products SET ProductName = 'Washing Machine'        WHERE ProductID = 148;
UPDATE Products SET ProductName = 'Steam Iron'             WHERE ProductID = 149;
UPDATE Products SET ProductName = 'Electric Oven'          WHERE ProductID = 150;



SELECT COUNT(*) AS TotalProducts
FROM Products;


SELECT TOP 10 *
FROM Products
ORDER BY ProductID DESC;

SELECT ProductID
FROM Products
ORDER BY ProductID;

-------------------------------------------------------------------------------



INSERT INTO Customers
    VALUES
       (5,'Ali Mahmoud','ali.mahmoud@gmail.com','Mansoura','Egypt','2024-05-10'),
       (6,'Nour Ahmed','nour.ahmed@gmail.com','Tanta','Egypt','2024-05-12'),
       (7,'Khaled Mostafa','khaled.m@gmail.com','Ismailia','Egypt','2024-05-14'),           
       (8,'Mariam Adel','mariam.adel@gmail.com','Port Said','Egypt','2024-05-18'),
       (9,'Hassan Ibrahim','hassan.ib@gmail.com','Zagazig','Egypt','2024-05-20'),
       (10,'Salma Wael','salma.wael@gmail.com','Alexandria','Egypt','2024-05-22'),
       (11,'Omar Samir','omar.samir@gmail.com','Cairo','Egypt','2024-05-25'),
       (12,'Aya Gamal','aya.gamal@gmail.com','Giza','Egypt','2024-05-28'),
       (13,'Youssef Adel','youssef.adel@gmail.com','Mansoura','Egypt','2024-06-01'),
       (14,'Menna Hany','menna.hany@gmail.com','Luxor','Egypt','2024-06-03'),
       (15,'Mahmoud Tarek','mahmoud.t@gmail.com','Aswan','Egypt','2024-06-05'),
       (16,'Nada Mohamed','nada.m@gmail.com','Cairo','Egypt','2024-06-07'),
       (17,'Karim Nasser','karim.n@gmail.com','Alexandria','Egypt','2024-06-09'),
       (18,'Reem Ashraf','reem.a@gmail.com','Giza','Egypt','2024-06-11'),      
       (19,'Ahmed Fathy','ahmed.f@gmail.com','Tanta','Egypt','2024-06-13'),
       (20,'Heba Ali','heba.ali@gmail.com','Ismailia','Egypt','2024-06-15'),
       (21,'Amr Saeed','amr.saeed@gmail.com','Cairo','Egypt','2024-06-18'),
       (22,'Doaa Salah','doaa.salah@gmail.com','Alexandria','Egypt','2024-06-20'),
       (23,'Mostafa Adel','mostafa.adel@gmail.com','Giza','Egypt','2024-06-22'),
       (24,'Esraa Hassan','esraa.hassan@gmail.com','Mansoura','Egypt','2024-06-24');


DECLARE @i INT = 25;
WHILE @i <= 100
BEGIN
INSERT INTO Customers
(CustomerID, FullName, Email, City, Country, SignupDate)
VALUES
( @i,
CONCAT('Customer ', @i),
CONCAT('customer', @i, '@gmail.com'),
CASE ABS(CHECKSUM(NEWID())) % 10
        WHEN 0 THEN 'Cairo'
        WHEN 1 THEN 'Giza'
        WHEN 2 THEN 'Alexandria'
        WHEN 3 THEN 'Mansoura'
        WHEN 4 THEN 'Tanta'
        WHEN 5 THEN 'Zagazig'
        WHEN 6 THEN 'Ismailia'
        WHEN 7 THEN 'Luxor'
        WHEN 8 THEN 'Aswan'
        ELSE 'Suez'
 END,
       'Egypt',
 DATEADD(DAY,
 ABS(CHECKSUM(NEWID())) % 365,'2024-01-01')
);
SET @i = @i + 1;
END;


    SELECT COUNT(*) AS TotalCustomers
FROM Customers;

------------------------------------------------------------------------------------

INSERT INTO Employees
    values
       (1, 'john smith', 'salas manager', '2022-01-01'),
       (2, 'david brown', 'salas rep' , '2023-06-15');

DECLARE @i INT = 3;
WHILE @i <= 10
BEGIN
INSERT INTO Employees
( EmployeeID, EmployeeName, Position, HireDate)
VALUES
(@i,
CONCAT('Employee ', @i),
CASE ABS(CHECKSUM(NEWID())) % 3
       WHEN 0 THEN 'Sales Rep'
       WHEN 1 THEN 'Sales Manager'
       ELSE 'Customer Support'
END,
DATEADD(DAY,ABS(CHECKSUM(NEWID())) % 800,'2022-01-01')
);
SET @i = @i + 1;
END;


SELECT *
FROM Employees;

    SELECT COUNT(*) AS TotalEmployees
FROM Employees;


--------------------------------------------------------------------------


INSERT INTO  Orders
    VALUES
       (1001, 1, 1, '2024-05-01', 16200),
       (1002, 2, 2, '2024-05-02', 1500),
       (1003, 3, 1, '2024-05-03', 7000);

DECLARE @OrderID INT = 1001;
WHILE @OrderID <= 1300
BEGIN
INSERT INTO Orders
(OrderID,CustomerID,EmployeeID,OrderDate,TotalAmount)
VALUES
( @OrderID,
ABS(CHECKSUM(NEWID())) % 100 + 1,
ABS(CHECKSUM(NEWID())) % 10 + 1,
DATEADD ( DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-01-01'),0);
SET @OrderID = @OrderID + 1;
END;

     SELECT COUNT(*) AS TotalOrders
FROM Orders;


---------------------------------------------------------------------------


INSERT INTO OrderDetails
    VALUES
    (1, 1001, 101, 1, 15000),
    (2, 1001, 102, 2, 300),
    (3, 1002, 104, 3, 250),
    (4, 1003, 106, 2, 450);

DELETE FROM OrderDetails;


DECLARE @OrderID INT = 1001;
DECLARE @DetailID INT = 1;
WHILE @OrderID <= 1300
BEGIN
DECLARE @ProductID INT =
        ABS(CHECKSUM(NEWID())) % 50 + 101;
DECLARE @Qty INT =
        ABS(CHECKSUM(NEWID())) % 4 + 1;
INSERT INTO OrderDetails
    ( OrderDetailID,OrderID,ProductID,Quantity,UnitPrice)
SELECT
      @DetailID,
      @OrderID,
      p.ProductID,
      @Qty,
      p.Price
FROM Products p
WHERE p.ProductID = @ProductID;
SET @OrderID += 1;
SET @DetailID += 1;
END;

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DECLARE @DetailID INT = 301;
WHILE @DetailID <= 700
BEGIN
DECLARE @OrderID INT =
        ABS(CHECKSUM(NEWID())) % 300 + 1001;
DECLARE @ProductID INT =
        ABS(CHECKSUM(NEWID())) % 50 + 101;
DECLARE @Qty INT =
        ABS(CHECKSUM(NEWID())) % 4 + 1;
INSERT INTO OrderDetails
    ( OrderDetailID,OrderID,ProductID,Quantity,UnitPrice)
SELECT
     @DetailID,
     @OrderID,
     p.ProductID,
     @Qty,
     p.Price
FROM Products p
WHERE p.ProductID = @ProductID;
SET @DetailID = @DetailID + 1;
END;


    SELECT COUNT(*) AS TotalOrderDetails
FROM OrderDetails;
       

--------------------------------------------------------------------------


INSERT INTO Payments
    VALUES
      (1, 1001, '2024-05-01', 'credit catd', 15600),
      (2, 1002, '2024-05-02', 'cash', 750),
      (3, 1003, '2024-05-03', 'vodafone cash', 900);
  
    DELETE FROM Payments;


DECLARE @PaymentID INT = 1;
DECLARE @OrderID INT = 1001;
WHILE @OrderID <= 1300
BEGIN
INSERT INTO Payments
(PaymentID, OrderID, PaymentDate,PaymentMethod,PaymentAmount)
SELECT
    @PaymentID,
    o.OrderID,
DATEADD
    (DAY, ABS(CHECKSUM(NEWID())) % 3,
        o.OrderDate ),
CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'Cash'
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Vodafone Cash'
        WHEN 3 THEN 'Instapay'
        ELSE 'Fawry'
END,
    o.TotalAmount
FROM Orders o
WHERE o.OrderID = @OrderID;
SET @PaymentID = @PaymentID + 1;
SET @OrderID = @OrderID + 1;
END;


 SELECT COUNT(*) AS TotalPayments
FROM Payments;



-------------------------------------------------------------------------------------       
    


                         ---SHOW TABLE IN VALUE DATA--   
-------------------------------------------------------------------------------------

 select * from customers;
 select * from products;
 select * from Orders;
 select * from OrderDetails;
 select * from Payments;


 -----------------------------------------------------------------------------------

                           --AGGREGATE FUNCTION--
             --WITH (SUM,COUNT.AVG) & ( INNER JOIN , LEFT JOIN)--
                           --( ROWE NUMBER )--
 ------------------------------------------------------------------------------------
    UPDATE o
SET o.TotalAmount = x.Total
FROM Orders o

INNER JOIN
(
SELECT
     OrderID,
SUM(Quantity * UnitPrice) AS Total
FROM OrderDetails
GROUP BY OrderID
) x
ON o.OrderID = x.OrderID;


SELECT TOP 10
OrderID,
TotalAmount
FROM Orders;


SELECT SUM(TotalAmount)AS Total_Sales 
from Orders;


SELECT COUNT(*) AS Total_Amount
FROM Orders;


SELECT AVG(TotalAmount) AS Avg_Orders
FROM Orders; 


SELECT top 10
FullName,
SUM(TotalAmount)as Total_Amount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID 
GROUP BY C.FullName 
ORDER BY Total_Amount DESC;


SELECT ProductName,
SUM(Quantity) AS Total_Sold
FROM products p
INNER JOIN OrderDetails od
ON P.productid = od.ProductID
GROUP BY productName
ORDER BY Total_Sold DESC;


SELECT ProductName,
SUM(Quantity*UnitPrice) AS Revenue
FROM Products p
INNER JOIN OrderDetails od
ON p.ProductID=od.ProductID            
GROUP BY p.ProductName
ORDER BY Revenue DESC;


SELECT City,
SUM(TotalAmount) AS Sales
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.City
ORDER BY Sales DESC;


SELECT EmployeeName,
COUNT(OrderID) AS TotalOrders
FROM Employees e
LEFT JOIN Orders o
ON e.EmployeeID=o.EmployeeID
GROUP BY e.EmployeeName;


SELECT EmployeeName,
SUM(TotalAmount) AS Sales
FROM Employees e
INNER JOIN Orders o
ON e.EmployeeID=o.EmployeeID
GROUP BY e.EmployeeName
ORDER BY Sales DESC;


SELECT ProductName
FROM Products p
LEFT JOIN OrderDetails od
ON p.ProductID=od.ProductID
WHERE od.ProductID IS NULL;


SELECT TOP 10 *
FROM Orders
ORDER BY TotalAmount DESC;


SELECT TOP 10 *
FROM Orders
ORDER BY TotalAmount;


SELECT
FullName,
SUM(TotalAmount) AS Sales,
DENSE_RANK() OVER
(
ORDER BY SUM(o.TotalAmount) DESC
)
AS CustomerRank

FROM Customers c
JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.FullName;


SELECT
ProductName,
SUM(Quantity) AS Sold,

ROW_NUMBER() OVER
(
ORDER BY SUM(od.Quantity) DESC
)
AS RankNo

FROM Products p
JOIN OrderDetails od
ON p.ProductID=od.ProductID
GROUP BY p.ProductName;


SELECT
PaymentMethod,
SUM(PaymentAmount) AS Total
FROM Payments
GROUP BY PaymentMethod
ORDER BY Total DESC;


SELECT
COUNT(*)
FROM
(
SELECT
CustomerID,
SUM(TotalAmount) AS Sales
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount)>=10000
)x;


SELECT
MONTH(OrderDate) AS MonthNo,
SUM(TotalAmount) AS Sales
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY Sales DESC;


SELECT

COUNT(DISTINCT CustomerID) Customers,

COUNT(OrderID) Orders,

SUM(TotalAmount) Sales,

AVG(TotalAmount) AvgOrder,

MAX(TotalAmount) HighestOrder,

MIN(TotalAmount) LowestOrder

FROM Orders;


SELECT
    CustomerID,                                        
SUM(TotalAmount) AS TotalSales 
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 5000;


SELECT 
    OrderID,
    FullName,
    OrderDate,
    TotalAmount
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;


SELECT 
    o.OrderID,
    c.FullName AS CustomerName,
    e.EmployeeName,
    o.OrderDate,
    o.TotalAmount
FROM Orders o

INNER JOIN Customers c
ON o.CustomerID = c.CustomerID

INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID;

SELECT 
c.CustomerID,
c.FullName,
o.OrderID
FROM customers C
LEFT JOIN Orders O
ON c.customerid = o.CustomerID;

select
    c.CustomerID,
    c.Fullname

FROM  customers c
LEFT JOIN Orders o
ON c.customerid = o.CustomerID
where o.OrderID is null;


SELECT
    c.CustomerID,
    c.FullName
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;


 SELECT
    c.FullName,
    o.OrderID,
    p.ProductName,
    od.Quantity
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID;


SELECT
SUM(totalAmount) AS totalSales
FROM Orders;               

SELECT 
COUNT(*) AS TotalOrders
FROM Orders;

SELECT
AVG(totalamount) AS AvgOrderValue
FROM Orders;

SELECT 
      c.FullName,
      SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
      inner join orders o
      ON c.CustomerID = o.CustOmerID
GROUP BY c.FullName
ORDER BY TotalSpent DESC;


SELECT
      p.productName,
      SUM(od.QuAntity) AS TotalSold
from products p
      INNER JOIN OrderDetails od
      ON p.productID =od.productID
GROUP BY P.productname
ORDER BY TotalSold;


SELECT
      p.ProductName,
      SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
      INNER JOIN OrderDetails od
      ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;


SELECT
      c.FullName,
      SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
      INNER JOIN Orders o
      ON c.CustomerID = o.CustomerID
GROUP BY c.FullName
ORDER BY TotalSpent DESC;


SELECT
      c.FullName,
      COUNT(o.OrderID) AS TotalOrders
FROM Customers c
      INNER JOIN Orders o
      ON c.CustomerID = o.CustomerID
GROUP BY c.FullName
ORDER BY TotalOrders DESC;


SELECT
      c.FullName,
      AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
      INNER JOIN Orders o
      ON c.CustomerID = o.CustomerID
GROUP BY c.FullName
ORDER BY AvgOrderValue DESC;

-----------------------------------------------------------------------------

                                -- (CASE) --

------------------------------------------------------------------------------

SELECT 
    ProductName,
    price,
CASE
    WHEN price > 5000 THEN 'expensive'
    ELSE 'cheap'
    END AS ProductCategory
    FROM products;



SELECT 
      c.FullName,
     SUM(o.TotalAmount) AS totalspent,
CASE
     WHEN SUM(o.TotalAmount) >= 10000 THEN 'VIP'
     WHEN SUM(o.TotalAmount) >= 5000 THEN 'REGULAR'
     ELSE 'New'
     END AS customertype
     FROM Customers c
     INNER JOIN Orders o
     ON c.CustomerID = O.CustomerID
     GROUP BY c.FullName;

 
SELECT *
      FROM Orders
      WHERE TotalAmount >
        (
        SELECT AVG(TotalAmount)
        FROM Orders
        );


SELECT *
       FROM products
       WHERE price >
        (
       SELECT avg(price)
       FROM products
        );


SELECT FullName 
       FROM customers
       WHERE customerid IN
        ( 
       SELECT customerid
       FROM Orders
        );
-----------------------------------------------------------------------------------

                                -- (CTE) --

----------------------------------------------------------------------------------
 WITH sales AS
 (
 SELECT
       c.FullName,
       SUM(o.TotalAmount) AS totalspent
       FROM customers c
       INNER JOIN Orders o
       ON c.customerid = o.CustomerID
       GROUP BY c.fullname
 )
 
 SELECT *
 FROM sales
 WHERE totalspent > 10000;


 WITH ExpensiveProducts AS
 (
 SELECT
       ProductName,
       price
       FROM products
       WHERE price > 5000
 )
 SELECT *
 FROM ExpensiveProducts;

 --------------------------------------------------------------------------

                         -- (ROWE NUMBER) --

 --------------------------------------------------------------------------
 SELECT
      Orderid,
      Customerid,
      TotalAmount,
      ROW_NUMBER () OVER
      (ORDER BY  TotalAmount DESC
      ) AS RowNum
      FROM Orders;


SELECT
      c.FullName,
      SUM(o.TotalAmount) AS Totalspent,
      DENSE_RANK() OVER 
      (ORDER BY SUM(o.TotalAmount) desc
      ) AS CustomerRank
      FROM customers c
      INNER JOIN orders o
      ON c.customerid = o.customerid
      GROUP BY c.FullName;

SELECT
     CustomerID,
     OrderID,
     TotalAmount,
     ROW_NUMBER() OVER
     (PARTITION BY CustomerID
      ORDER BY TotalAmount DESC
     ) AS rn
     FROM Orders


SELECT 
      OrderID,
      customerID,
      TotalAmount,
      lag(TotalAmount) OVER
      (ORDER BY OrderID
      ) AS PreviousAmount
      FROM Orders; 

SELECT
      OrderID,
      TotalAmount,        
      LEAD(TotalAmount) OVER
      (ORDER BY OrderID
      ) AS NextAmount
      FROM Orders;
--------------------------------------------------------------------------

                            -- (VIEW) --

--------------------------------------------------------------------------

CREATE VIEW CustomerSales AS
SELECT
    c.FullName,
    SUM(o.TotalAmount) AS TotalSales
    FROM Customers c
    INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
    GROUP BY c.FullName;

SELECT *
from CustomerSales
-----------------------------------------------------------------------

                              -- (PROCEDURE) --

-----------------------------------------------------------------------
CREATE PROCEDURE GetAllCustomer
    AS
    BEGIN 
SELECT *
FROM customers;
    END;

EXEC GetAllCustomer     
           

SELECT*
FROM SYS.procedures;

DROP PROCEDURE IF EXISTS CustomerSalesReport;
GO


CREATE PROCEDURE CustomerSalesReport
    AS
    BEGIN
SELECT
    c.FullName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSales,
    AVG(o.TotalAmount) AS AvgOrder,
    MAX(o.TotalAmount) AS HighestOrder,
    MIN(o.TotalAmount) AS LowestOrder
    FROM Customers c
    INNER JOIN Orders o
    ON c.CustomerID=o.CustomerID
    GROUP BY c.FullName
    ORDER BY TotalSales DESC;
    END;  

EXEC CustomerSalesReport


   
DROP PROCEDURE IF EXISTS GetCustomerOrders;
GO

CREATE PROCEDURE GetCustomerOrders
    @CustomerID INT
     AS
    BEGIN
SELECT *
    FROM Orders
    WHERE CustomerID = @CustomerID;
    END;
    GO

EXEC GetCustomerOrders 3;


SELECT DISTINCT CustomerID
FROM Orders;


DROP PROCEDURE IF EXISTS CheckCustomerType;
GO


CREATE PROCEDURE CheckCustomerType
    @CustomerID INT
    AS
    BEGIN
    DECLARE @TotalSales DECIMAL(10,2);
    SELECT @TotalSales = ISNULL(SUM(TotalAmount), 0)
    FROM Orders
    WHERE CustomerID = @CustomerID;
    
SELECT
    @CustomerID AS CustomerID,
    @TotalSales AS TotalSales,

      CASE
          WHEN @TotalSales >= 10000 THEN 'VIP Customer'
          ELSE 'Regular Customer'
      END AS CustomerType;

     END;
     GO

EXEC CheckCustomerType 1;
-----------------------------------------------------------------------------
                  
                          -- (FUNCTION) --

-----------------------------------------------------------------------------    
CREATE FUNCTION dbo.GetCustomerTotalSales
(
    @CustomerID INT
)
RETURNS DECIMAL(10,2)
      AS
      BEGIN

    DECLARE @TotalSales DECIMAL(10,2);
    SELECT @TotalSales = ISNULL(SUM(TotalAmount),0)
    FROM Orders
    WHERE CustomerID = @CustomerID;
    RETURN @TotalSales;
    END;
    GO

SELECT dbo.GetCustomerTotalSales(3) AS TotalSales;





CREATE FUNCTION dbo.GetCustomerOrdersTable
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        OrderID,
        OrderDate,
        TotalAmount
    FROM Orders
    WHERE CustomerID = @CustomerID
);
GO

SELECT *
FROM dbo.GetCustomerOrdersTable(3);


DELETE FROM Orders
WHERE Orderid = 101;

SELECT *
FROM Orders;

SELECT *
FROM products;
----------------------------------------------------------------------------

                         -- (TRANSACTION) --

-----------------------------------------------------------------------------
BEGIN TRANSACTION;
INSERT INTO Orders( OrderID, CustomerID, EmployeeID,  OrderDate, TotalAmount)
VALUES
(1004,3,1, GETDATE(),1500);
INSERT INTO OrderDetails
( OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(5,1004, 102, 1, 300);
UPDATE Products
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 102;
COMMIT;



BEGIN TRANSACTION;
INSERT INTO Orders
VALUES(1005,2,2,GETDATE(),300);
SELECT *
FROM Orders;
ROLLBACK

select *
from Orders
order by OrderID

select *
from OrderDetails
ORDER BY OrderDetailID;

SELECT ProductID, ProductName, StockQuantity
from products
WHERE productid = 102;

SELECT *
FROM Orders;


BEGIN TRY
    BEGIN TRANSACTION;
    INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount)
    VALUES
    (1006, 3, 1, GETDATE(), 300);
    INSERT INTO OrderDetails
    (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
    VALUES
    ( 6, 1006, 102, 1, 300);
    UPDATE Products
    SET StockQuantity = StockQuantity - 1
    WHERE ProductID = 102;
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-----------------------------------------------------------
BEGIN TRY
    BEGIN TRANSACTION;
    INSERT INTO Orders
    ( OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount)
    VALUES
    ( 1006, 3, 1, GETDATE(), 300);
    INSERT INTO OrderDetails
    ( OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
    VALUES
    (5, 1006, 102, 1, 300);
    UPDATE Products
    SET StockQuantity = StockQuantity - 1
    WHERE ProductID = 102;
COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;





