USE my_electronic_repair;

CREATE TABLE `customer_details`
		(
			`customer_id` INT
				UNSIGNED NOT NULL,
			`points` INT
				UNSIGNED,
			`city` VARCHAR(50),
			`state` VARCHAR(2),
			`dob` DATE
				NOT NULL,
			`customer_since` DATE
				NOT NULL,
			KEY fk_customer_id (customer_id),
			CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
				ON DELETE RESTRICT ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;