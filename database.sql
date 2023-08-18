USE master;

-- Create the database
CREATE DATABASE MosjidDonation;
GO

-- Use the newly created database
USE MosjidDonation;
GO

-- Create Users table
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL
);

-- Create Admin table
CREATE TABLE Admin (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL
);

-- Create Mosque table
CREATE TABLE Mosque (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200) NOT NULL
);

-- Create Zakat table
CREATE TABLE Zakat (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Amount DECIMAL(18, 2) NOT NULL,
    Date DATE NOT NULL,
    IsDistributed BIT NOT NULL,
    MosqueId INT NOT NULL,
    UserId INT NOT NULL,
    DistributionId INT
);

-- Create Donation table
CREATE TABLE Donation (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Category NVARCHAR(50) NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL,
    Date DATE NOT NULL,
    IsDistributed BIT NOT NULL,
    MosqueId INT NOT NULL,
    UserId INT NOT NULL,
    DistributionId INT
);

-- Create Distribution table
CREATE TABLE Distribution (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Date DATE NOT NULL,
    DistributedBy INT NOT NULL
);

-- Insert data into Users table
INSERT INTO Users (Username, Email, Password, Phone)
VALUES
    ('john_doe', 'john@example.com', 'hashed_password', '123-456-7890'),
    ('jane_smith', 'jane@example.com', 'hashed_password', '987-654-3210'),
    ('ahmed_ali', 'ahmed@example.com', 'hashed_password', '555-555-5555'),
    ('sarah_jones', 'sarah@example.com', 'hashed_password', '111-222-3333'),
    ('michael_brown', 'michael@example.com', 'hashed_password', '444-444-4444'),
    ('emily_wilson', 'emily@example.com', 'hashed_password', '666-777-8888'),
    ('abdullah_khan', 'abdullah@example.com', 'hashed_password', '999-888-7777'),
    ('olivia_davis', 'olivia@example.com', 'hashed_password', '222-333-4444'),
    ('ali_mohamed', 'ali@example.com', 'hashed_password', '777-888-9999'),
    ('sophia_lee', 'sophia@example.com', 'hashed_password', '555-666-7777');

-- Insert data into Admin table
INSERT INTO Admin (Username, Email, Password, Phone)
VALUES
    ('admin1', 'admin1@example.com', 'admin_password', '111-111-1111'),
    ('admin2', 'admin2@example.com', 'admin_password', '222-222-2222');

-- Insert data into Mosque table
INSERT INTO Mosque (Name, Location)
VALUES
    ('Al-Farooq Mosque', '123 Main Street, City'),
    ('Noor Islamic Center', '456 Elm Avenue, Town'),
    ('Masjid Al-Huda', '789 Oak Lane, Village'),
    ('Masjid An-Nur', '101 Maple Road, Suburb'),
    ('Islamic Center of Peace', '555 Pine Street, Town'),
    ('Al-Iman Mosque', '666 Elm Street, City'),
    ('Masjid Ar-Rahman', '777 Willow Avenue, Village'),
    ('Masjid Al-Amin', '888 Oak Road, Suburb'),
    ('Masjid As-Salam', '999 Maple Avenue, Town'),
    ('Islamic Center of Unity', '111 Cedar Lane, City');

-- Insert data into Zakat table
INSERT INTO Zakat (Amount, Date, IsDistributed, MosqueId, UserId, DistributionId)
VALUES
    (500.00, '2023-08-10', 1, 1, 1, 1),
    (300.00, '2023-08-12', 0, 2, 2, NULL),
    (150.00, '2023-08-13', 1, 1, 3, 1),
    (200.00, '2023-08-14', 0, 2, 4, NULL),
    (400.00, '2023-08-15', 1, 1, 5, 1),
    (100.00, '2023-08-16', 0, 2, 6, NULL),
    (250.00, '2023-08-17', 1, 1, 7, 2),
    (180.00, '2023-08-18', 0, 2, 8, NULL),
    (350.00, '2023-08-19', 1, 1, 9, 2),
    (220.00, '2023-08-20', 0, 2, 10, NULL);

-- Insert data into Donation table
INSERT INTO Donation (Category, Amount, Date, IsDistributed, MosqueId, UserId, DistributionId)
VALUES
    ('Quran', 50.00, '2023-08-10', 1, 1, 1, 1),
    ('Jaymanaz', 75.00, '2023-08-12', 0, 2, 2, NULL),
    ('Dress', 30.00, '2023-08-13', 1, 1, 3, 1),
    ('Food', 40.00, '2023-08-14', 0, 2, 4, NULL),
    ('Money', 6000.00, '2023-08-15', 1, 1, 5, 1),
    ('Dress', 20.00, '2023-08-16', 0, 2, 6, NULL),
    ('Dress', 45.00, '2023-08-17', 1, 1, 7, 2),
    ('Food', 35.00, '2023-08-18', 0, 2, 8, NULL),
    ('Jaynamaz', 55.00, '2023-08-19', 1, 1, 9, 2),
    ('Money', 5000.00, '2023-08-20', 0, 2, 10, NULL);

-- Insert data into Distribution table
INSERT INTO Distribution (Date, DistributedBy)
VALUES
    ('2023-08-15', 1),
    ('2023-08-17', 2);

-- Add foreign key constraints

-- Zakat.MosqueId references Mosque.Id
ALTER TABLE Zakat
ADD CONSTRAINT FK_Zakat_MosqueId FOREIGN KEY (MosqueId) REFERENCES Mosque(Id);

-- Zakat.UserId references Users.Id
ALTER TABLE Zakat
ADD CONSTRAINT FK_Zakat_UserId FOREIGN KEY (UserId) REFERENCES Users(Id);

-- Zakat.DistributionId references Distribution.Id
ALTER TABLE Zakat
ADD CONSTRAINT FK_Zakat_DistributionId FOREIGN KEY (DistributionId) REFERENCES Distribution(Id);

-- Donation.MosqueId references Mosque.Id
ALTER TABLE Donation
ADD CONSTRAINT FK_Donation_MosqueId FOREIGN KEY (MosqueId) REFERENCES Mosque(Id);

-- Donation.UserId references Users.Id
ALTER TABLE Donation
ADD CONSTRAINT FK_Donation_UserId FOREIGN KEY (UserId) REFERENCES Users(Id);

-- Donation.DistributionId references Distribution.Id
ALTER TABLE Donation
ADD CONSTRAINT FK_Donation_DistributionId FOREIGN KEY (DistributionId) REFERENCES Distribution(Id);

-- Distribution.DistributedBy references Admin.Id
ALTER TABLE Distribution
ADD CONSTRAINT FK_Distribution_DistributedBy FOREIGN KEY (DistributedBy) REFERENCES Admin(Id);
