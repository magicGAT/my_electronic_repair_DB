-- tools table procedures 

-- 1) Add tool | permission level: 3

DELIMITER $$

CREATE PROCEDURE tools_add_tool
	(
		t_name VARCHAR(255),
		t_manufacturer VARCHAR(255),
		t_quantity INT,
		t_cost DECIMAL(10,2),
		t_source VARCHAR(255)
	)

	BEGIN
		INSERT INTO tools VALUES (DEFAULT, t_name, t_manufacturer, t_quantity, t_cost, t_source);
	END $$

DELIMITER ;

-- 2) Delete tool  | permission level: 4
--		(NOTE: DELETING A TOOL WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF A TOOL IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE tools_delete_tool
	(
		t_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM tools
		WHERE tools.tool_name = t_name;
	END $$

DELIMITER ;

-- 3) Update tool | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE tools_update_record
	(
		t_id INT,
		t_name VARCHAR(50),
		t_manufacturer VARCHAR(50),
		t_quantity INT,
		t_cost DECIMAL(10,2),
		t_source VARCHAR(255)
	)

	BEGIN
		UPDATE tools
		SET
			tools.tool_name = t_name,
			tools.manufacturer = t_manufacturer,
			tools.quantity = t_quantity,
			tools.cost_each = t_cost,
			tools.item_source = t_source
		WHERE 
			tools.tool_id = t_id; 
	END $$

DELIMITER ;
