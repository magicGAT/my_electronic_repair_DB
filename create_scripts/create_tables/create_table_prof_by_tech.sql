USE my_electronic_repair;

	CREATE TABLE `prof_by_tech`
		(
			`tech_id` INT
				UNSIGNED NOT NULL,
			`device_id` INT
				UNSIGNED NOT NULL,
			KEY fk_tech_id1 (tech_id),
			CONSTRAINT fk_tech_id1 FOREIGN KEY (tech_id) REFERENCES technicians (tech_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_device_id1 (device_id),
			CONSTRAINT fk_device_id1 FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE RESTRICT ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;