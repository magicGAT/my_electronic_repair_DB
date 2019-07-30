USE my_electronic_repair;

	CREATE TABLE `client_devices`
		(
			`customer_id` INT
				UNSIGNED NOT NULL,
			`device_id` INT
				UNSIGNED NOT NULL,
			`date_record_added` DATE
				NOT NULL,
			KEY fk_customer_id1 (customer_id),
			CONSTRAINT fk_customer_id1 FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_device_id2 (device_id),
			CONSTRAINT fk_device_id2 FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE RESTRICT ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;