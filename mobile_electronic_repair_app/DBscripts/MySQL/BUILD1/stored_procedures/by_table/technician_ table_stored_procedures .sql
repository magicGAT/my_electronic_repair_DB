-- technicians table procedures 

-- 1) Add technician | permission level: 3

DELIMITER $$

CREATE PROCEDURE technicians_add_technician
	(
		t_fname VARCHAR(50),
		t_lname VARCHAR(50)
	)

	BEGIN
		INSERT INTO technicians VALUES (DEFAULT, t_fname, t_lname);
	END $$

DELIMITER ;

-- 2) Delete technician  | permission level: 4
--		(NOTE: DELETING A TECHNICIAN WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN A TECHNICIAN LEAVES EMPLOYMENT AT YOUR BUSINESS. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE technicians_delete_technician
	(
		t_fname VARCHAR(255),
		t_lname VARCHAR(255)
	)

	BEGIN
		DELETE FROM technicians
		WHERE 
			technicians.first_name = t_fname
			AND
			technicians.last_name = t_lname;
	END $$

DELIMITER ;

-- 3) Update technician | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE technicians_update_record
	(
		t_id INT,
		t_fname VARCHAR(50),
		t_lname VARCHAR(50)
	)

	BEGIN
		UPDATE technicians 
		SET
			technicians.first_name = t_fname,
			technicians.last_name = t_lname
		WHERE 
			technicians.tech_id = t_id;
	END $$

DELIMITER ;

-- test 1
-- CALL technicians_add_technician("test", "test1")
-- test 2
-- CALL technicians_delete_technician("test", "test1")
-- test 3
-- CALL technicians_update_record(1, "alter", "alter1")
