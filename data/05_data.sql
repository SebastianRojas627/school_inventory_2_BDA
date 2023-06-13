USE school_inventory;

INSERT INTO Person (Id, Name, LastName, Address, ContactNumber)
VALUES
  (1, 'John', 'Doe', '123 Main St', '1234567'),
  (2, 'Jane', 'Smith', '456 Elm St', '2345678'),
  (3, 'David', 'Johnson', '789 Oak St', '3456789'),
  (4, 'Sarah', 'Williams', '321 Pine St', '4567890'),
  (5, 'Michael', 'Brown', '654 Cedar St', '5678901'),
  (6, 'John', 'Doe', '123 Main St', '1234567'),
  (7, 'Jane', 'Smith', '456 Elm St', '2345678'),
  (8, 'David', 'Johnson', '789 Oak St', '3456789'),
  (9, 'Sarah', 'Williams', '321 Pine St', '4567890'),
  (10, 'Michael', 'Brown', '654 Cedar St', '5678901');

INSERT INTO Student (StudentId, Grade)
VALUES
  (1, '2S'),
  (2, '1P'),
  (3, '4S'),
  (4, '5S'),
  (5, '3P');

INSERT INTO Teacher (TeacherId, Subject)
VALUES
  (6, 'Math'),
  (7, 'Science'),
  (8, 'English'),
  (9, 'History'),
  (10, 'Art');

INSERT INTO Region (RegionID, RegionName)
VALUES
  (1, 'North'),
  (2, 'South'),
  (3, 'East'),
  (4, 'West'),
  (5, 'Central');

INSERT INTO School (SchoolID, SchoolName, RegionID)
VALUES
  (1, 'ABC High School', 1),
  (2, 'XYZ High School', 2),
  (3, '123 Middle School', 3),
  (4, '456 Elementary School', 4),
  (5, '789 Academy', 5);

INSERT INTO SchoolLocation (SchoolID, GPSLatitude, GPSLongitude)
VALUES
  (1, 37.123456, -122.654321),
  (2, 38.654321, -121.123456),
  (3, 39.987654, -120.345678),
  (4, 40.234567, -119.876543),
  (5, 41.876543, -118.987654);

INSERT INTO Provider (ProviderID, ProviderName, Address, ContactNumber)
VALUES
  (1, 'ABC Supplies', '789 Supplier St', '123-456-7890'),
  (2, 'XYZ Distributors', '321 Distributor St', '234-567-8901'),
  (3, '123 Suppliers', '456 Provider St', '345-678-9012'),
  (4, '456 Distributors', '789 Distributor St', '456-789-0123'),
  (5, '789 Suppliers', '321 Provider St', '567-890-1234');

INSERT INTO Supply (SupplyID, SupplyName, SupplyQuantity, Description)
VALUES
  (1, 'Pencils', 100, 'Standard wooden pencils'),
  (2, 'Notebooks', 50, 'Spiral-bound notebooks'),
  (3, 'Markers', 20, 'Assorted color markers'),
  (4, 'Erasers', 200, 'Pink rectangular erasers'),
  (5, 'Rulers', 30, '12-inch plastic rulers');

INSERT INTO ProviderSupply (PurchaseID, ProviderID, SupplyID, Price, Quantity)
VALUES
  (1, 1, 1, 1.99, 500),
  (2, 2, 2, 2.99, 250),
  (3, 3, 3, 3.99, 100),
  (4, 4, 4, 0.99, 1000),
  (5, 5, 5, 1.49, 200);

INSERT INTO StudentSchool (StudentID, SchoolID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

INSERT INTO TeacherSchool (TeacherID, SchoolID)
VALUES
  (6, 1),
  (7, 2),
  (8, 3),
  (9, 4),
  (10, 5);

INSERT INTO SupplyTransaction (TransactionID, SchoolID, SupplyID, TransactionDate, Quantity)
VALUES
  (1, 1, 1, '2023-06-01', 50),
  (2, 2, 2, '2023-06-02', 25),
  (3, 3, 3, '2023-06-03', 10),
  (4, 4, 4, '2023-06-04', 100),
  (5, 5, 5, '2023-06-05', 15);

INSERT INTO TransactionStatus (TransactionID, Status)
VALUES
  (1, 'Pending'),
  (2, 'Completed'),
  (3, 'Pending'),
  (4, 'Completed'),
  (5, 'Pending');
