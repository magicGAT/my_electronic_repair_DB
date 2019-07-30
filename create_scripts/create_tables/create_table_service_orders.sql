USE my_electronic_repair;

	CREATE TABLE `service_orders`
		(
			`service_order_id` INT 
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			`customer_id` INT
				UNSIGNED NOT NULL,
			`tech_id` INT 
				UNSIGNED NOT NULL,
			`service_id` INT
				UNSIGNED NOT NULL,
			`date_time_placed` DATETIME
				NOT NULL,
			`service_location` VARCHAR(255)
				NOT NULL,
			`date_time_scheduled` DATETIME
				NOT NULL,
			PRIMARY KEY (service_order_id),
			KEY fk_customer_id2 (customer_id),
			CONSTRAINT fk_customer_id2 FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_tech_id2 (tech_id),
			CONSTRAINT fk_tech_id2 FOREIGN KEY (tech_id) REFERENCES technicians (tech_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_service_id2 (service_id),
			CONSTRAINT fk_service_id2 FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE RESTRICT ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;