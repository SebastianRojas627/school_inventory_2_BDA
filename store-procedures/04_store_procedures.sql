use school_inventory;

DELIMITER //

CREATE PROCEDURE CreateStudent(
	IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_lastName VARCHAR(100),
    IN p_address VARCHAR(100),
    IN p_number VARCHAR(7),
    IN s_grade VARCHAR(10)
)
BEGIN

    INSERT INTO Person (Id, Name, LastName, Address, ContactNumber) 
    VALUES (p_id, p_name, p_lastName, p_address, p_number);
    INSERT INTO Student (StudentId, Grade) VALUES (p_id, s_grade);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateTeacher(
	IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_lastName VARCHAR(100),
    IN p_address VARCHAR(100),
    IN p_number VARCHAR(7),
    IN t_subject VARCHAR(50)
)
BEGIN

    INSERT INTO Person (Id, Name, LastName, Address, ContactNumber) VALUES (p_id, p_name, p_lastName, p_address, p_number);
    INSERT INTO Teacher (TeacherId, Subject) VALUES (p_id, t_subject);
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetSchoolsInRange(
    IN p_minLatitude DECIMAL(9, 6),
    IN p_minLongitude DECIMAL(9, 6),
    IN p_maxLatitude DECIMAL(9, 6),
    IN p_maxLongitude DECIMAL(9, 6)
)
BEGIN
    SELECT s.SchoolID, s.SchoolName, l.GPSLatitude, l.GPSLongitude
    FROM SchoolLocation AS l
    INNER JOIN School AS s ON l.SchoolID = s.SchoolID
    WHERE l.GPSLatitude BETWEEN p_minLatitude AND p_maxLatitude
        AND l.GPSLongitude BETWEEN p_minLongitude AND p_maxLongitude;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateGrades()
BEGIN
    UPDATE Student SET Grade = CONCAT(CAST(LEFT(Grade, 1) + 1 AS CHAR), RIGHT(Grade, 1))
    WHERE LEFT(Grade, 1) BETWEEN '1' AND '5';

    UPDATE Student SET Grade = 'LEFT' WHERE Grade = '6S';
    
    UPDATE Student SET Grade = '1S' WHERE Grade = '6P';
    
    SELECT 'Grades updated successfully.';
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE LowQuantitySupplies(IN amount INT)
BEGIN
    SELECT SupplyID, SupplyName, SupplyQuantity, Description
    FROM Supply
    WHERE SupplyQuantity < amount;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ResupplyCost(IN cost INT)
BEGIN
    SELECT ProviderID, SupplyID, Price, Quantity
    FROM ProviderSupply
    WHERE Price > cost;
END//
DELIMITER ;
