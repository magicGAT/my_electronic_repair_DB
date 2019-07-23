-- customers table procedures 

-- 1) Add customer | permission level: 3

DELIMITER $$

CREATE PROCEDURE customers_add_customer
	(
		c_fname VARCHAR(255),
		c_lname VARCHAR(255),
		c_email VARCHAR(255),
		c_phone VARCHAR(50),
		c_lead BOOLEAN,
		c_active BOOLEAN
	)

	BEGIN
		INSERT INTO customers VALUES (DEFAULT, c_fname, c_lname, c_email, c_phone, c_lead, c_active);
	END $$

DELIMITER ;

-- 2) Delete customer  | permission level: 4
--		(NOTE: DELETING A CUSTOMER WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN CUSTOMER BECOMES INACTIVE. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE customers_delete_customer 
	(
		c_fname VARCHAR (255),
		c_lname VARCHAR (255)
	)

	BEGIN
		DELETE FROM customers
		WHERE 
			customers.first_name = c_fname 
			AND
			customers.last_name = c_lname;
	END $$

DELIMITER ;

-- 3) Update customer | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE customers_update_record
	(
		c_id INT,
		c_fname VARCHAR(255),
		c_lname VARCHAR(255),
		c_email VARCHAR(255),
		c_phone VARCHAR(50),
		c_lead BOOLEAN,
		c_active BOOLEAN
	)

	BEGIN
		UPDATE customers
		SET 
			customers.first_name = c_fname,
			customers.last_name = c_lname,
			customers.email = c_email,
			customers.phone = c_phone,
			customers.lead_stat = c_lead,
			customers.active_stat = c_active
		WHERE 
			customers.customer_id = c_id;
	END $$

DELIMITER ;

-- test 1
-- CALL customers_add_customer("test", "test1", "test2", "test4", FALSE, FALSE)
-- test 2 
-- CALL customers_delete_customer("test", "test1")
-- test 3 
-- CALL customers_update_record(1, "test", "test1", "test2", "test4", FALSE, FALSE)