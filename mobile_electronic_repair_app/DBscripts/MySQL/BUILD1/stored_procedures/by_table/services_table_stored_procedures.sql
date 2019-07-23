-- services table procedures

-- 1) Add service | permission level: 3

DELIMITER $$

CREATE PROCEDURE services_add_service
	(
		s_device_id INT,
		s_name VARCHAR(255),
		s_price DECIMAL(10,2),
		s_point_value INT
	)

	BEGIN
		INSERT INTO services VALUES (DEFAULT, s_device_id, s_name, s_price, s_point_value);
	END $$

DELIMITER ;

-- 2) Delete service  | permission level: 4
--		(NOTE: DELETING A SERVICE WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN A SERVICE IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE services_delete_service 
	(
		s_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM services
		WHERE services.service_name = s_name;
	END $$

DELIMITER ;

-- 3) Update service | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE services_update_record
	(
		s_id INT,
		s_device_id INT,
		s_name VARCHAR(255),
		s_price DECIMAL(10,2),
		s_point_value INT
	)

	BEGIN
		UPDATE services 
		SET
			services.device_id = s_device_id,
			services.service_name = s_name,
			services.price = s_price,
			services.point_value = s_point_value
		WHERE 
			services.service_id = s_id;
	END $$

DELIMITER ;

-- test 1
-- CALL services_add_service(1, "test", 0.00, 100)
-- test 2 
-- CALL services_delete_service("test")
-- test 3 
-- CALL services_update_record(1, 1, "alter", 0.00, 150)