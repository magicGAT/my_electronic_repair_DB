USE my_electronic_repair;

	CREATE TABLE services
		(
			service_id INT
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			device_id INT 
				UNSIGNED NOT NULL,
			service_name VARCHAR(255)
				NOT NULL,
			price DECIMAL(10,2)
				NOT NULL,
			point_value SMALLINT
				UNSIGNED,
			PRIMARY KEY (service_id),
			KEY fk_device_id (device_id),
			CONSTRAINT fk_device_id FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE RESTRICT ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;