-- parts table procedures 

-- 1) Add part | permission level: 3

DELIMITER $$

CREATE PROCEDURE parts_add_part
	(
		p_name VARCHAR(255),
		p_manufacturer VARCHAR(255),
		p_quantity INT,
		p_cost DECIMAL(10,2),
		p_source VARCHAR(255)
	)

	BEGIN
		INSERT INTO parts VALUES (DEFAULT, p_name, p_manufacturer, p_quantity, p_cost, p_source);
	END $$

DELIMITER ;

-- 2) Delete part  | permission level: 4 
--		(NOTE: DELETING A PART WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF A PART IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE parts_delete_part
	(
		p_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM parts
		WHERE parts.part_name = p_name;
	END $$

DELIMITER ;

-- 3) Update part | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE parts_update_record 
	(
		p_id INT,
		p_name VARCHAR(50),
		p_manufacturer VARCHAR(50),
		p_quantity INT,
		p_cost DECIMAL (10,2),
		p_source VARCHAR(50)
	)

	BEGIN
		UPDATE parts
		SET
			parts.part_name = p_name,
			parts.manufacturer = p_manufacturer,
			parts.quantity = p_quantity,
			parts.cost_each = p_cost,
			parts.item_source = p_source
		WHERE 
			parts.part_id = p_id;
	END $$

DELIMITER ;