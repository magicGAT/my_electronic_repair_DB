USE my_electronic_repair;

	CREATE TABLE parts_by_service
		(
			service_id INT
				UNSIGNED NOT NULL,
			part_id INT
				UNSIGNED NOT NULL,
			KEY fk_service_id1 (service_id),
			CONSTRAINT fk_service_id1 FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_part_id (part_id),
			CONSTRAINT fk_part_id FOREIGN KEY (part_id) REFERENCES parts (part_id)
				ON DELETE RESTRICT ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;