-- Creating a table named 'Artisans' to store information about artisans
CREATE TABLE Artisans (
    ArtisanID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each artisan
    Name VARCHAR(100), -- Name of the artisan
    Bio TEXT, -- Short biography of the artisan
    ContactInfo VARCHAR(255), -- Contact information of the artisan
    -- Add the missing column name here
    ProfilePicture VARCHAR(255) -- Profile picture of the artisan
);
-- Products Table 
CREATE TABLE Products ( 
    ProductID INT PRIMARY KEY AUTO_INCREMENT,  
    ArtisanID INT, 
    Title VARCHAR(100), 
    Description TEXT, 
    Price DECIMAL(10, 2), 
    Availability BOOLEAN, 
    Images TEXT, 
    Category VARCHAR(50), 
    FOREIGN KEY (ArtisanID) REFERENCES Artisans(ArtisanID) 
);
 -- Users Table 
CREATE TABLE Users ( 
    UserID INT PRIMARY KEY AUTO_INCREMENT, 
    Username VARCHAR(50), 
    Email VARCHAR(100), 
    Password VARCHAR(255), 
    UserType ENUM('Artisan', 'Buyer') 
); -- Orders Table 
CREATE TABLE Orders ( 
    UserID INT, 
    OrderID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    TotalAmount DECIMAL(10, 2), 
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
); -- OrderDetails Table 
CREATE TABLE OrderDetails ( 
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT, 
    ProductID INT, 
    Quantity INT, 
    Price DECIMAL(10, 2), 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
); 

INSERT INTO Artisans (ArtisanID, Name, Bio, ContactInfo, ProfilePicture)  
VALUES  
(1, 'Rajesh Patel', 'Skilled in traditional pottery.', 'rajesh@example.com', 'pottery.jpg'), 
(2, 'Priya Shah', 'Crafts intricate Indian jewelry.', 'priya@example.com', 'jewelry.jpg');

INSERT INTO Products (ProductID, ArtisanID, Title, Description, Price, Availability, Images, Category)  
VALUES  
(101, 1, 'Terracotta Diya Set', 'Handcrafted terracotta lamps for Diwali', 25.99, 1, 'diya_set_image1.jpg,diya_set_image2.jpg', 'Pottery'), 
(102, 2, 'Kundan Necklace Set', 'Traditional Kundan jewelry set', 69.99, 1, 'kundan_necklace_image1.jpg', 'Jewelry');

INSERT INTO Users (UserID, Username, Email, Password, UserType)  
VALUES  
(1, 'user456', 'user456@example.com', 'hashedpass3', 'Buyer'), 
(2, 'artist_ind', 'artist_ind@example.com', 'hashedpass4', 'Artisan'); 

INSERT INTO Orders (OrderID, UserID, OrderDate, TotalAmount)  
VALUES  
(1003, 1, '2023-02-20 09:45:00', 95.98), 
(1004, 2, '2023-02-21 11:15:00', 69.99); 

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price)  
VALUES  
(5003, 1003, 101, 1, 25.99), 
(5004, 1004, 102, 1, 69.99); 
