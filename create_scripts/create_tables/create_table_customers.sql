USE my_electronic_repair;

CREATE TABLE `customers`
	(
		`customer_id` INT
			UNSIGNED NOT NULL UNIQUE
			AUTO_INCREMENT,
		`first_name` VARCHAR(50)
			NOT NULL,
		`last_name` VARCHAR(50)
			NOT NULL,
		`email` VARCHAR(60),
		`phone` VARCHAR(30),
		`lead_stat` BOOLEAN 
			NOT NULL,
		`active_stat` BOOLEAN
			NOT NULL,
		PRIMARY KEY (customer_id)
	)
	ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;