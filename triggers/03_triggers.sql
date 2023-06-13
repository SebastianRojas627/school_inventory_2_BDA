use school_inventory;

DELIMITER //
CREATE TRIGGER check_supply_amount
BEFORE INSERT ON SupplyTransaction
FOR EACH ROW
BEGIN
    DECLARE available_quantity INT;
    DECLARE supply_name VARCHAR(50);

    SELECT SupplyQuantity INTO available_quantity
    FROM Supply
    WHERE SupplyId = NEW.SupplyId;
    
    SELECT SupplyName Into supply_name
    FROM Supply
    WHERE SupplyId = NEW.SupplyId;

    IF NEW.Quantity > available_quantity THEN
        SET @err_message = CONCAT('Insufficient supply of ', supply_name, ' available to complete the transaction');
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = @err_message;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER modify_suppy_amount
AFTER INSERT ON SupplyTransaction
FOR EACH ROW
BEGIN
    UPDATE Supply
    SET SupplyQuantity = SupplyQuantity - NEW.Quantity
    WHERE SupplyID = NEW.SupplyID;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER format_phone_number
BEFORE INSERT ON Provider
FOR EACH ROW
BEGIN
    SET NEW.ContactNumber = CONCAT(
        SUBSTRING(NEW.ContactNumber, 1, 3),
        '-',
        SUBSTRING(NEW.ContactNumber, 4)
    );
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER format_phone_number_person
BEFORE INSERT ON Person
FOR EACH ROW
BEGIN
    SET NEW.ContactNumber = CONCAT(
        SUBSTRING(NEW.ContactNumber, 1, 3),
        '-',
        SUBSTRING(NEW.ContactNumber, 4)
    );
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER format_grade
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    DECLARE new_grade VARCHAR(10);
    SET new_grade = NEW.Grade;
    
    SET new_grade = REPLACE(new_grade, ' ', '');
    
    IF LENGTH(new_grade) > 1 THEN
        SET new_grade = CONCAT(LEFT(new_grade, 1), UPPER(SUBSTRING(new_grade, 2)));
    END IF;
    
    IF LENGTH(new_grade) < 2 OR UPPER(SUBSTRING(new_grade, 2, 1)) NOT IN ('P', 'S') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid grade format. The second character must be P or S.';
    END IF;
    
    SET NEW.Grade = new_grade;
END//
DELIMITER ;