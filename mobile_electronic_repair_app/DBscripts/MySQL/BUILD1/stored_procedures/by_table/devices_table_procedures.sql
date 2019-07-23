-- devices table procedures

-- 1) Add device | permission level: 3

DELIMITER $$

CREATE PROCEDURE devices_add_device
	(
		device_name VARCHAR(255),
		manufacturer VARCHAR(255),
		release_date DATE
	)

	BEGIN
		INSERT INTO devices VALUES (DEFAULT, device_name, manufacturer, release_date);
	END $$

DELIMITER ;

-- 2) Delete device  | permission level: 4 
--		(NOTE: DELETING A DEVICE WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF DEVICE IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE devices_remove_device
	(
		d_name VARCHAR(255)
	)

	BEGIN 
		DELETE FROM devices
		WHERE devices.device_name = d_name;
	END $$


DELIMITER ;

-- 3) Update device | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE devices_update_record
	(
		d_id INT, 
		d_name VARCHAR(255),
		d_manufacturer VARCHAR(255),
		d_release DATE 
	)

	BEGIN
		UPDATE devices 
		SET 
			devices.device_name = d_name, 
			devices.manufacturer = d_manufacturer,
			devices.release_date = d_release
		WHERE 
			devices.device_id = d_id; 
	END $$

DELIMITER ;
