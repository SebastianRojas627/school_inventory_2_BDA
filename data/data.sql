INSERT INTO Student (StudentID, StudentName, Grade, Address, ContactNumber)
VALUES
  (1, 'John Smith', '9th Grade', '123 Main St', '123-456-7890'),
  (2, 'Jane Doe', '10th Grade', '456 Elm St', '987-654-3210'),
  (3, 'Michael Johnson', '11th Grade', '789 Oak St', '555-123-4567');

INSERT INTO Teacher (TeacherID, TeacherName, Subject)
VALUES
  (1, 'Mr. Anderson', 'Mathematics'),
  (2, 'Ms. Johnson', 'English'),
  (3, 'Mr. Thompson', 'Science');


INSERT INTO Region (RegionID, RegionName)
VALUES
  (1, 'North Region'),
  (2, 'South Region'),
  (3, 'East Region');

INSERT INTO School (SchoolID, SchoolName, RegionID)
VALUES
  (1, 'ABC School', 1),
  (2, 'XYZ School', 2),
  (3, 'PQR School', 3);

INSERT INTO SchoolLocation (SchoolID, GPSLatitude, GPSLongitude)
VALUES
  (1, 40.7128, -74.0060),
  (2, 34.0522, -118.2437),
  (3, 51.5074, -0.1278);

INSERT INTO Provider (ProviderID, ProviderName, Address, ContactNumber)
VALUES
  (1, 'ABC Provider', '123 Provider St', '111-222-3333'),
  (2, 'XYZ Provider', '456 Provider Rd', '444-555-6666'),
  (3, 'PQR Provider', '789 Provider Ave', '777-888-9999');

INSERT INTO Supply (SupplyID, SupplyName, SupplyQuantity, Description)
VALUES
  (1, 'Pens', 50, 'Black ink pens'),
  (2, 'Notebooks', 50, 'Spiral-bound notebooks'),
  (3, 'Markers', 50, 'Assorted color markers');

INSERT INTO ProviderSupply (ProviderID, SupplyID, Price, Quantity)
VALUES
  (1, 1, 1.99, 100),
  (2, 2, 2.50, 50),
  (3, 3, 3.49, 75);

INSERT INTO StudentSchool (StudentID, SchoolID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

INSERT INTO TeacherSchool (TeacherID, SchoolID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

INSERT INTO SupplyTransaction (TransactionID, SchoolID, SupplyID, TransactionDate, Quantity)
VALUES
  (1, 1, 1, '2023-01-10', 5),
  (2, 2, 2, '2023-02-15', 3),
  (3, 3, 3, '2023-03-20', 2);

INSERT INTO TransactionStatus (TransactionID, Status)
VALUES
  (1, 'Completed'),
  (2, 'Pending'),
  (3, 'Completed');
