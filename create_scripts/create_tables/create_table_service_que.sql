USE my_electronic_repair;

	CREATE TABLE `service_que`
		(
			`ticket_id` INT
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			`service_order`_id INT
				UNSIGNED NOT NULL,
			`completed` BOOLEAN
				NOT NULL,
			`date_time_began` DATETIME,
			`date_time_completed` DATETIME,
			PRIMARY KEY (ticket_id),
			KEY fk_service_order_id (service_order_id),
			CONSTRAINT fk_service_order_id FOREIGN KEY (service_order_id) REFERENCES service_orders (service_order_id)
				ON DELETE RESTRICT ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;