## 📚 Assignment Questions

### Question 1 Achieving 1NF (First Normal Form) 🛠️
SELECT
  OrderID,
  CustomerName,
  TRIM(product) AS Product
FROM ProductDetail,
JSON_TABLE(
  CONCAT('["', REPLACE(Products, ',', '","'), '"]'),
  '$[*]' COLUMNS (product VARCHAR(100) PATH '$')
) AS jt;




### Question 2 Achieving 2NF (Second Normal Form) 🧩


-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Create the OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT, 
    PRIMARY KEY (OrderID, Product), 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails; 

-- Insert data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;