USE my_electronic_repair;

	CREATE TABLE tech_details
		(
			`tech_id` INT 
				UNSIGNED NOT NULL,
			`dob` DATE 
				NOT NULL,
			`hire_date` DATE
				NOT NULL,
			`points` INT
				UNSIGNED,
			`street` VARCHAR(255)
				NOT NULL,
			`city` VARCHAR(255)
				NOT NULL,
			`state` VARCHAR(2)
				NOT NULL,
			KEY fk_tech_id (tech_id),
			CONSTRAINT fk_tech_id FOREIGN KEY (tech_id) REFERENCES technicians (tech_id)
				ON DELETE RESTRICT ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;