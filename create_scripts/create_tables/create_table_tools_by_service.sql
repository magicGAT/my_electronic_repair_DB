USE my_electronic_repair;

	CREATE TABLE `tools_by_service`
		(
			`service_id` INT 
				UNSIGNED NOT NULL,
			`tool_id` INT
				UNSIGNED NOT NULL,
			KEY fk_service_id (service_id),
			CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE RESTRICT ON UPDATE CASCADE,
			KEY fk_tool_id (tool_id),
			CONSTRAINT fk_tool_id FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;