USE my_electronic_repair;

DROP TABLE IF EXISTS tools;
CREATE TABLE `tools`
	(
		`tool_id` INT
			UNSIGNED NOT NULL UNIQUE
			AUTO_INCREMENT,
		`tool_name` VARCHAR(255)
			NOT NULL,
		`manufacturer` VARCHAR(255),
		`quantity` INT 
			UNSIGNED NOT NULL,
		`cost_each` DECIMAL(10,2) 
			UNSIGNED NOT NULL,
		`item_source` VARCHAR(255),
		PRIMARY KEY (tool_id)
	)
	ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;