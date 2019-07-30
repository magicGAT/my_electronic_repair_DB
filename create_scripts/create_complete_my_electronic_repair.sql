DROP DATABASE IF EXISTS my_electronic_repair;
CREATE DATABASE `my_electronic_repair`;
USE my_electronic_repair;
	
    CREATE TABLE `devices` 
		(
			`device_id` INT 
				UNSIGNED NOT NULL UNIQUE 
                AUTO_INCREMENT,
			`device_name` VARCHAR(255) 
				NOT NULL,
			`manufacturer` VARCHAR(255)
            	NOT NULL,
			`release_date` DATE,
			PRIMARY KEY (device_id)
		)
        ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;
        
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

	CREATE TABLE `parts`
		(
			`part_id` INT
				UNSIGNED NOT NULL UNIQUE 
				AUTO_INCREMENT,
			`part_name` VARCHAR(255)
				NOT NULL,
			`manufacturer` VARCHAR(255),
			`quantity` INT 
				UNSIGNED NOT NULL,
			`cost_each` DECIMAL(10,2)
				UNSIGNED NOT NULL,
			`item_source` VARCHAR(255),
			PRIMARY KEY (part_id) 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

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
	
	CREATE TABLE `services`
		(
			`service_id` INT
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			`device_id` INT 
				UNSIGNED NOT NULL,
			`service_name` VARCHAR(255)
				NOT NULL,
			`price` DECIMAL(10,2)
				NOT NULL,
			`point_value` SMALLINT
				UNSIGNED,
			PRIMARY KEY (service_id),
			KEY fk_device_id (device_id),
			CONSTRAINT fk_device_id FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE CASCADE ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

	CREATE TABLE `tools_by_service`
		(
			`service_id` INT 
				UNSIGNED NOT NULL,
			`tool_id` INT
				UNSIGNED NOT NULL,
			KEY fk_service_id (service_id),
			CONSTRAINT fk_service_id1 FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_tool_id (tool_id),
			CONSTRAINT fk_tool_id1 FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;


	CREATE TABLE `parts_by_service`
		(
			`service_id` INT
				UNSIGNED NOT NULL,
			`part_id` INT
				UNSIGNED NOT NULL,
			KEY fk_service_id2 (service_id),
			CONSTRAINT fk_service_id2 FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_part_id (part_id),
			CONSTRAINT fk_part_id FOREIGN KEY (part_id) REFERENCES parts (part_id)
				ON DELETE CASCADE ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;


	CREATE TABLE `tech_details`
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
				ON DELETE CASCADE ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

	CREATE TABLE `prof_by_tech`
		(
			`tech_id` INT
				UNSIGNED NOT NULL,
			`device_id` INT
				UNSIGNED NOT NULL,
			KEY fk_tech_id1 (tech_id),
			CONSTRAINT fk_tech_id1 FOREIGN KEY (tech_id) REFERENCES technicians (tech_id)
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_device_id1 (device_id),
			CONSTRAINT fk_device_id1 FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE CASCADE ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

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
			customer_since DATE,
			KEY fk_customer_id (customer_id),
			CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
				ON DELETE CASCADE ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

	CREATE TABLE `client_devices`
		(
			`customer_id` INT
				UNSIGNED NOT NULL,
			`device_id` INT
				UNSIGNED NOT NULL,
			`date_record_added` DATE
				NOT NULL,
			KEY fk_customer_id1 (customer_id),
			CONSTRAINT fk_customer_id1 FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_device_id2 (device_id),
			CONSTRAINT fk_device_id2 FOREIGN KEY (device_id) REFERENCES devices (device_id)
				ON DELETE CASCADE ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

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
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_tech_id2 (tech_id),
			CONSTRAINT fk_tech_id2 FOREIGN KEY (tech_id) REFERENCES technicians (tech_id)
				ON DELETE CASCADE ON UPDATE CASCADE,
			KEY fk_service_id3 (service_id),
			CONSTRAINT fk_service_id3 FOREIGN KEY (service_id) REFERENCES services (service_id)
				ON DELETE CASCADE ON UPDATE CASCADE
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;

	CREATE TABLE `service_que`
		(
			`ticket_id` INT
				UNSIGNED NOT NULL UNIQUE
				AUTO_INCREMENT,
			`service_order_id` INT
				UNSIGNED NOT NULL,
			`completed` BOOLEAN
				DEFAULT FALSE NOT NULL,
			`date_time_began` DATETIME,
			`date_time_completed` DATETIME,
			PRIMARY KEY (ticket_id),
			KEY fk_service_order_id (service_order_id),
			CONSTRAINT fk_service_order_id FOREIGN KEY (service_order_id) REFERENCES service_orders (service_order_id)
				ON DELETE CASCADE ON UPDATE CASCADE 
		)
		ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_bin;








