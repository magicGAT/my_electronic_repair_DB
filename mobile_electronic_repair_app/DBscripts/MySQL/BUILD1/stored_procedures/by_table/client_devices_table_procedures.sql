-- client_devices table procedures

-- 1) Add client/device relationship | permission level: 3

DELIMITER $$

CREATE PROCEDURE client_device_add_relationship
	(
		c_id INT,
		d_id INT
	)
	BEGIN
		INSERT INTO client_devices VALUES (c_id, d_id, curdate());
	END $$

DELIMITER ; 

-- 2) Delete client/device relationship | permission level: 3

DELIMITER $$
	
CREATE PROCEDURE client_device_delete_relationship
	(
		c_id INT,
		d_id INT
	) 
	
	BEGIN
		DELETE FROM client_devices 
		WHERE 
			client_devices.customer_id = c_id
			AND
			client_devices.device_id = d_id;  
	END $$

DELIMITER ;

-- test 1
-- CALL client_device_add_relationship(1, 4)
-- test 2 
-- CALL client_device_delete_relationship(1, 4)