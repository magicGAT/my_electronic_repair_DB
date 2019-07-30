-- query based stored procedures

-- Find all active customers 

DELIMITER $$

CREATE PROCEDURE get_all_active_customers()

	BEGIN
		SELECT *
		FROM customers 
		WHERE 
			active_stat = 1
			lead_stat = 0 
	END $$

DELIMITER ;

-- Find all active leads

DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;

-- Find all inactive customers

DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;

-- Find all inactive leads

DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;


-- ---------------------------------------------------------------------------------------------
-- Find active customers with specified device
-- & add partner function for converting device name -> device id for better user experience

CREATE PROCEDURE get_active_customers_with_device
	(
		target_device_id INT
	)

	BEGIN
		SELECT
			d.device_name,
			first_name,
			last_name,
			email,
			phone
		FROM customers c
		JOIN client_devices cd
			USING (customer_id)
		JOIN devices d
			USING (device_id)
		WHERE cd.device_id = target_device_id;
	END $$

DELIMITER ;

-- Find active leads with specified device 

DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE 
	(

	)

	BEGIN

	END $$

DELIMITER ;
