use school_inventory;

-- Student and ShadowStudent

DELIMITER //

CREATE TRIGGER StudentInsertShadow
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    INSERT INTO ShadowStudent (StudentId, Grade, Operation)
    VALUES (NEW.StudentId, NEW.Grade, 'INSERT');
END//

CREATE TRIGGER StudentUpdateShadow
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO ShadowStudent (StudentId, Grade, Operation)
    VALUES (NEW.StudentId, NEW.Grade, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER StudentDeleteShadow
AFTER DELETE ON Student
FOR EACH ROW
BEGIN
    INSERT INTO ShadowStudent (StudentId, Grade, Operation)
    VALUES (OLD.StudentId, OLD.Grade, 'DELETE');
END//

DELIMITER ;

-- Teacher and ShadowTeacher

DELIMITER //

CREATE TRIGGER TeacherInsertShadow
AFTER INSERT ON Teacher
FOR EACH ROW
BEGIN
    INSERT INTO ShadowTeacher (TeacherId, Subject, Operation)
    VALUES (NEW.TeacherId, NEW.Subject, 'INSERT');
END//

CREATE TRIGGER TeacherUpdateShadow
AFTER UPDATE ON Teacher
FOR EACH ROW
BEGIN
    INSERT INTO ShadowTeacher (TeacherId, Subject, Operation)
    VALUES (NEW.TeacherId, NEW.Subject, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER TeacherDeleteShadow
AFTER DELETE ON Teacher
FOR EACH ROW
BEGIN
    INSERT INTO ShadowTeacher (TeacherId, Subject, Operation)
    VALUES (OLD.TeacherId, OLD.Subject, 'DELETE');
END//

DELIMITER ;

-- School and ShadowSchool

DELIMITER //

CREATE TRIGGER SchoolInsertShadow
AFTER INSERT ON School
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSchool (SchoolID, SchoolName, RegionID, Operation)
    VALUES (NEW.SchoolID, NEW.SchoolName, NEW.RegionID, 'INSERT');
END//

CREATE TRIGGER SchoolUpdateShadow
AFTER UPDATE ON School
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSchool (SchoolID, SchoolName, RegionID, Operation)
    VALUES (NEW.SchoolID, NEW.SchoolName, NEW.RegionID, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER SchoolDeleteShadow
AFTER DELETE ON School
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSchool (SchoolID, SchoolName, RegionID, Operation)
    VALUES (OLD.SchoolID, OLD.SchoolName, OLD.RegionID, 'DELETE');
END//

DELIMITER ;

-- Supply and ShadowSupply

DELIMITER //

CREATE TRIGGER SupplyInsertShadow
AFTER INSERT ON Supply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupply (SupplyID, SupplyName, SupplyQuantity, Description, Operation)
    VALUES (NEW.SupplyID, NEW.SupplyName, NEW.SupplyQuantity, NEW.Description, 'INSERT');
END//

CREATE TRIGGER SupplyUpdateShadow
AFTER UPDATE ON Supply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupply (SupplyID, SupplyName, SupplyQuantity, Description, Operation)
    VALUES (NEW.SupplyID, NEW.SupplyName, NEW.SupplyQuantity, NEW.Description, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER SupplyDeleteShadow
AFTER DELETE ON Supply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupply (SupplyID, SupplyName, SupplyQuantity, Description, Operation)
    VALUES (OLD.SupplyID, OLD.SupplyName, OLD.SupplyQuantity, OLD.Description, 'DELETE');
END//

DELIMITER ;

-- ProviderSupply and ShadowProviderSupply

DELIMITER //

CREATE TRIGGER ProviderSupplyInsertShadow
AFTER INSERT ON ProviderSupply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowProviderSupply (ProviderID, SupplyID, Price, Quantity, Operation)
    VALUES (NEW.ProviderID, NEW.SupplyID, NEW.Price, NEW.Quantity, 'INSERT');
END//

CREATE TRIGGER ProviderSupplyUpdateShadow
AFTER UPDATE ON ProviderSupply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowProviderSupply (ProviderID, SupplyID, Price, Quantity, Operation)
    VALUES (NEW.ProviderID, NEW.SupplyID, NEW.Price, NEW.Quantity, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER ProviderSupplyDeleteShadow
AFTER DELETE ON ProviderSupply
FOR EACH ROW
BEGIN
    INSERT INTO ShadowProviderSupply (ProviderID, SupplyID, Price, Quantity, Operation)
    VALUES (OLD.ProviderID, OLD.SupplyID, OLD.Price, OLD.Quantity, 'DELETE');
END//

DELIMITER ;

-- SupplyTransaction and ShadowSupplyTransaction

DELIMITER //

CREATE TRIGGER SupplyTransactionInsertShadow
AFTER INSERT ON SupplyTransaction
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupplyTransaction (TransactionID, SchoolID, SupplyID, TransactionDate, Quantity, Operation)
    VALUES (NEW.TransactionID, NEW.SchoolID, NEW.SupplyID, NEW.TransactionDate, NEW.Quantity, 'INSERT');
END//

CREATE TRIGGER SupplyTransactionUpdateShadow
AFTER UPDATE ON SupplyTransaction
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupplyTransaction (TransactionID, SchoolID, SupplyID, TransactionDate, Quantity, Operation)
    VALUES (NEW.TransactionID, NEW.SchoolID, NEW.SupplyID, NEW.TransactionDate, NEW.Quantity, 'UPDATE');
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER SupplyTransactionDeleteShadow
AFTER DELETE ON SupplyTransaction
FOR EACH ROW
BEGIN
    INSERT INTO ShadowSupplyTransaction (TransactionID, SchoolID, SupplyID, TransactionDate, Quantity, Operation)
    VALUES (OLD.TransactionID, OLD.SchoolID, OLD.SupplyID, OLD.TransactionDate, OLD.Quantity, 'DELETE');
END//

DELIMITER ;