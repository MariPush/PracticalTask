DECLARE @s varchar;
SET @s =1;
CREATE TABLE dbo.SKU 
(
ID int identity (1,1),
Name nchar(30),
Code AS (1 + ID) PERSISTED UNIQUE,   
CONSTRAINT PK_SKU PRIMARY KEY (ID)

)
CREATE TABLE dbo.Family
(
ID int identity (1,1),
SurName nchar(30),
BudgetValue float,
CONSTRAINT PK_Family PRIMARY KEY (ID)

)
CREATE TABLE dbo.Basket
(
ID int identity (1,1),
ID_SKU int,
ID_Family int,
Quantity int CHECK(Quantity> 0),
Value int CHECK(Value> 0),
PurchaseDate date Default SYSDATETIME(),
DiscountValue int,
CONSTRAINT FK_Basket_ID_SKU FOREIGN KEY(ID_SKU) REFERENCES dbo.SKU(ID),
CONSTRAINT FK_Basket_ID_Family FOREIGN KEY(ID_Family) REFERENCES dbo.Family (ID)
)
