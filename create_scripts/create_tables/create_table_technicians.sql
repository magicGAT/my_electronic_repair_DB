USE my_electronic_repair;

CREATE TABLE `technicians`
		(
			`tech_id` INT 
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			`first_name` VARCHAR(50)
				NOT NULL,
			`last_name` VARCHAR(50)
				NOT NULL,
			PRIMARY KEY (tech_id)
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;