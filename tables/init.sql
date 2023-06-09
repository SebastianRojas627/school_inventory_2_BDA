CREATE TABLE Person (
  Id INT PRIMARY KEY,
  Name VARCHAR(100),
  LastName VARCHAR(100),
  Address VARCHAR(100),
  ContactNumber VARCHAR(20)
);

CREATE TABLE Student (
  StudentId INT PRIMARY KEY REFERENCES Person (Id),
  Grade VARCHAR(10)
);

CREATE TABLE Teacher (
  TeacherId INT PRIMARY KEY REFERENCES Person (Id),
  Subject VARCHAR(50)
);

CREATE TABLE Region (
  RegionID INT PRIMARY KEY,
  RegionName VARCHAR(100)
);

CREATE TABLE School (
  SchoolID INT PRIMARY KEY,
  SchoolName VARCHAR(100),
  RegionID INT,
  SchoolYear INT,
  FOREIGN KEY (RegionID) REFERENCES Region (RegionID)
);

CREATE TABLE SchoolLocation (
  SchoolID INT,
  GPSLatitude DECIMAL(9,6),
  GPSLongitude DECIMAL(9,6),
  PRIMARY KEY (SchoolID),
  FOREIGN KEY (SchoolID) REFERENCES School (SchoolID)
);

CREATE TABLE Provider (
  ProviderID INT PRIMARY KEY,
  ProviderName VARCHAR(100),
  Address VARCHAR(100),
  ContactNumber VARCHAR(20)
);

CREATE TABLE Supply (
  SupplyID INT PRIMARY KEY,
  SupplyName VARCHAR(100),
  SupplyQuantity INT,
  Description VARCHAR(200)
);

CREATE TABLE ProviderSupply (
  ProviderID INT,
  SupplyID INT,
  Price DECIMAL(8,2),
  Quantity INT,
  PRIMARY KEY (ProviderID, SupplyID),
  FOREIGN KEY (ProviderID) REFERENCES Provider (ProviderID),
  FOREIGN KEY (SupplyID) REFERENCES Supply (SupplyID)
);

CREATE TABLE StudentSchool (
  StudentID INT,
  SchoolID INT,
  PRIMARY KEY (StudentID, SchoolID),
  FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
  FOREIGN KEY (SchoolID) REFERENCES School (SchoolID)
);

CREATE TABLE TeacherSchool (
  TeacherID INT,
  SchoolID INT,
  PRIMARY KEY (TeacherID, SchoolID),
  FOREIGN KEY (TeacherID) REFERENCES Teacher (TeacherID),
  FOREIGN KEY (SchoolID) REFERENCES School (SchoolID)
);

CREATE TABLE SupplyTransaction (
  TransactionID INT PRIMARY KEY,
  SchoolID INT,
  SupplyID INT,
  TransactionDate DATE,
  Quantity INT,
  FOREIGN KEY (SchoolID) REFERENCES School (SchoolID),
  FOREIGN KEY (SupplyID) REFERENCES Supply (SupplyID)
);

CREATE TABLE TransactionStatus (
  TransactionID INT PRIMARY KEY,
  Status VARCHAR(50),
  FOREIGN KEY (TransactionID) REFERENCES SupplyTransaction (TransactionID)
);