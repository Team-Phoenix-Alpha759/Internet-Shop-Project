/*
MySQL Queries to create TABLES based on the ER diagram of Ishop Project
*/

/*
Queries to check databases and tables
SHOW DATABASES;
USE ISHOP
SHOW TABLES;
*/

CREATE TABLE Admin_Login(
	AD_Email VARCHAR(50) NOT NULL,
	AD_Password VARCHAR(26) NOT NULL,
    PRIMARY KEY (AD_Email) 
    );
     
CREATE TABLE Admin_Details(
	AD_Email VARCHAR(50) NOT NULL,
	AD_FirstName VARCHAR(25) NOT NULL,
	AD_LastName VARCHAR(25) NOT NULL,
	AD_Address VARCHAR(50) NOT NULL,
	AD_ZipCode INTEGER(11) NOT NULL,
    FOREIGN KEY (AD_Email) REFERENCES Admin_Login(AD_Email) 
);

CREATE TABLE Customer_Login (
	Customer_Email VARCHAR(50) NOT NULL,
	Customer_pwd VARCHAR(26) NOT NULL,
	PRIMARY KEY ( Customer_Email)
);

INSERT INTO Customer_Login(Customer_Email,Customer_pwd) values ("piyushpipada@gmail.com","ppp90");

CREATE TABLE Customer_Details (
	Customer_ID VARCHAR(25) NOT NULL,
	Customer_Email VARCHAR(50) NOT NULL,
	Customer_FirstName VARCHAR(20) NOT NULL,
	Customer_LastName VARCHAR(20) NOT NULL,
	Customer_Address VARCHAR(50) NOT NULL,
	Customer_ZipCode INTEGER(10) NOT NULL,
	PRIMARY KEY (Customer_ID),
	FOREIGN KEY( Customer_Email) REFERENCES Customer_Login( Customer_Email)	
);


CREATE TABLE Category(
	Category_ID VARCHAR(20) NOT NULL,
	CategoryName VARCHAR(30) NOT NULL,
	PRIMARY KEY (Category_ID)
);

CREATE TABLE Brand(
	Brand_ID VARCHAR (15) NOT NULL,
	BrandName VARCHAR(25) NOT NULL,
	PRIMARY KEY (Brand_ID)
);


CREATE TABLE Product(
	Product_ID VARCHAR(20) NOT NULL,
	ProductName VARCHAR(20) NOT NULL,
	Price FLOAT(5,2)NOT NULL,
	Brand_ID VARCHAR (15) NOT NULL,
	Category_ID VARCHAR(20) NOT NULL,
	Quantity_in_stock INTEGER NOT NULL,
	PRIMARY KEY (Product_ID) ,
	FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID),
	FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
	);


CREATE TABLE Cart(
	Cart_ID VARCHAR(20) NOT NULL,
	ProductQuantity VARCHAR(15) NOT NULL,
	Product_ID VARCHAR(20) NOT NULL,
	Customer_ID VARCHAR(50) NOT NULL,
	PRIMARY KEY (Cart_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer_Details (Customer_ID)
);

CREATE TABLE Payment(
	Cart_ID VARCHAR(20) NOT NULL,
	Payment_ID VARCHAR(20) NOT NULL,	
	Payment_Type VARCHAR(10) NOT NULL,
	Processed_Date VARCHAR(12) NOT NULL,
	PRIMARY KEY (Payment_ID),
	FOREIGN KEY (Cart_ID) REFERENCES Cart( Cart_ID ) 
);

CREATE TABLE Order_Details(
	Customer_ID VARCHAR(50) NOT NULL,
	Order_ID VARCHAR(20) NOT NULL,
	Total_Amount FLOAT(7,2) NOT NULL,
	Ordered_Date VARCHAR(12) NOT NULL,
	Payment_ID VARCHAR(20) NOT NULL,
	PRIMARY KEY (Order_ID),
	FOREIGN KEY ( Payment_ID) REFERENCES Payment(Payment_ID),
	FOREIGN KEY ( Customer_ID) REFERENCES Customer_Details (Customer_ID)
);

CREATE TABLE Order_Summary(
	Order_ID VARCHAR(20) NOT NULL,
	Tracking_ID VARCHAR(30) NOT NULL,
	Order_Status VARCHAR(12) NOT NULL,
	FOREIGN KEY ( Order_ID) REFERENCES Order_Details(Order_ID)
);

CREATE TABLE Review(
	Product_ID VARCHAR(20) NOT NULL,
	Customer_ID VARCHAR(50) NOT NULL,
	Review_ID VARCHAR(20),
	Customer_Comments VARCHAR(100),
	PRIMARY KEY (Review_ID),
	FOREIGN KEY ( Customer_ID) REFERENCES Customer_Details (Customer_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
);

CREATE TABLE Wishlist(
	Product_ID VARCHAR(20) NOT NULL,
	Customer_ID VARCHAR(50) NOT NULL,
	Created_Date VARCHAR(15) NOT NULL,
	Notifiy VARCHAR(1) NOT NULL,
	FOREIGN KEY ( Customer_ID) REFERENCES Customer_Details (Customer_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID)
);


