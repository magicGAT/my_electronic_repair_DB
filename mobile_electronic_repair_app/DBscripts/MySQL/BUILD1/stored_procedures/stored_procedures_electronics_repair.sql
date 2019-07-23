-- Stored Procedures Master List 

-- NOTE: ALL TESTS REQUIRE THAT my_electronic_repair BE CREATED AND FILLED WITH dummy_data_electronic_repair
-- ---------------------------------------------------------------------------------------------------
-- devices table procedures

-- 1) Add device | permission level: 3

DELIMITER $$

CREATE PROCEDURE devices_add_device
	(
		device_name VARCHAR(255),
		manufacturer VARCHAR(255),
		release_date DATE
	)

	BEGIN
		INSERT INTO devices VALUES (DEFAULT, device_name, manufacturer, release_date);
	END $$

DELIMITER ;

-- 2) Delete device  | permission level: 4 
--		(NOTE: DELETING A DEVICE WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF DEVICE IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE devices_remove_device
	(
		d_name VARCHAR(255)
	)

	BEGIN 
		DELETE FROM devices
		WHERE devices.device_name = d_name;
	END $$


DELIMITER ;

-- 3) Update device | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE devices_update_record
	(
		d_id INT, 
		d_name VARCHAR(255),
		d_manufacturer VARCHAR(255),
		d_release DATE 
	)

	BEGIN
		UPDATE devices 
		SET 
			devices.device_name = d_name, 
			devices.manufacturer = d_manufacturer,
			devices.release_date = d_release
		WHERE 
			devices.device_id = d_id; 
	END $$

DELIMITER ;

-- ---------------------------------------------------------------------------------------------------
-- tools table procedures 

-- 1) Add tool | permission level: 3

DELIMITER $$

CREATE PROCEDURE tools_add_tool
	(
		t_name VARCHAR(255),
		t_manufacturer VARCHAR(255),
		t_quantity INT,
		t_cost DECIMAL(10,2),
		t_source VARCHAR(255)
	)

	BEGIN
		INSERT INTO tools VALUES (DEFAULT, t_name, t_manufacturer, t_quantity, t_cost, t_source);
	END $$

DELIMITER ;

-- 2) Delete tool  | permission level: 4
--		(NOTE: DELETING A TOOL WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF A TOOL IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE tools_delete_tool
	(
		t_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM tools
		WHERE tools.tool_name = t_name;
	END $$

DELIMITER ;

-- 3) Update tool | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE tools_update_record
	(
		t_id INT,
		t_name VARCHAR(50),
		t_manufacturer VARCHAR(50),
		t_quantity INT,
		t_cost DECIMAL(10,2),
		t_source VARCHAR(255)
	)

	BEGIN
		UPDATE tools
		SET
			tools.tool_name = t_name,
			tools.manufacturer = t_manufacturer,
			tools.quantity = t_quantity,
			tools.cost_each = t_cost,
			tools.item_source = t_source
		WHERE 
			tools.tool_id = t_id; 
	END $$

DELIMITER ;

-- ---------------------------------------------------------------------------------------------------
-- parts table procedures 

-- 1) Add part | permission level: 3

DELIMITER $$

CREATE PROCEDURE parts_add_part
	(
		p_name VARCHAR(255),
		p_manufacturer VARCHAR(255),
		p_quantity INT,
		p_cost DECIMAL(10,2),
		p_source VARCHAR(255)
	)

	BEGIN
		INSERT INTO parts VALUES (DEFAULT, p_name, p_manufacturer, p_quantity, p_cost, p_source);
	END $$

DELIMITER ;

-- 2) Delete part  | permission level: 4 
--		(NOTE: DELETING A PART WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN USE OF A PART IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE parts_delete_part
	(
		p_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM parts
		WHERE parts.part_name = p_name;
	END $$

DELIMITER ;

-- 3) Update part | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE parts_update_record 
	(
		p_id INT,
		p_name VARCHAR(50),
		p_manufacturer VARCHAR(50),
		p_quantity INT,
		p_cost DECIMAL (10,2),
		p_source VARCHAR(50)
	)

	BEGIN
		UPDATE parts
		SET
			parts.part_name = p_name,
			parts.manufacturer = p_manufacturer,
			parts.quantity = p_quantity,
			parts.cost_each = p_cost,
			parts.item_source = p_source
		WHERE 
			parts.part_id = p_id;
	END $$

DELIMITER ;

-- ---------------------------------------------------------------------------------------------------
-- customers table procedures 

-- 1) Add customer | permission level: 3

DELIMITER $$

CREATE PROCEDURE customers_add_customer
	(
		c_fname VARCHAR(255),
		c_lname VARCHAR(255),
		c_email VARCHAR(255),
		c_phone VARCHAR(50),
		c_lead BOOLEAN,
		c_active BOOLEAN
	)

	BEGIN
		INSERT INTO customers VALUES (DEFAULT, c_fname, c_lname, c_email, c_phone, c_lead, c_active);
	END $$

DELIMITER ;

-- 2) Delete customer  | permission level: 4
--		(NOTE: DELETING A CUSTOMER WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN CUSTOMER BECOMES INACTIVE. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE customers_delete_customer 
	(
		c_fname VARCHAR (255),
		c_lname VARCHAR (255)
	)

	BEGIN
		DELETE FROM customers
		WHERE 
			customers.first_name = c_fname 
			AND
			customers.last_name = c_lname;
	END $$

DELIMITER ;

-- 3) Update customer | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE customers_update_record
	(
		c_id INT,
		c_fname VARCHAR(255),
		c_lname VARCHAR(255),
		c_email VARCHAR(255),
		c_phone VARCHAR(50),
		c_lead BOOLEAN,
		c_active BOOLEAN
	)

	BEGIN
		UPDATE customers
		SET 
			customers.first_name = c_fname,
			customers.last_name = c_lname,
			customers.email = c_email,
			customers.phone = c_phone,
			customers.lead_stat = c_lead,
			customers.active_stat = c_active
		WHERE 
			customers.customer_id = c_id;
	END $$

DELIMITER ;

-- test 1
-- CALL customers_add_customer("test", "test1", "test2", "test4", FALSE, FALSE)
-- test 2 
-- CALL customers_delete_customer("test", "test1")
-- test 3 
-- CALL customers_update_record(1, "test", "test1", "test2", "test4", FALSE, FALSE)

-- ---------------------------------------------------------------------------------------------------
-- technicians table procedures 

-- 1) Add technician | permission level: 3

DELIMITER $$

CREATE PROCEDURE technicians_add_technician
	(
		t_fname VARCHAR(50),
		t_lname VARCHAR(50)
	)

	BEGIN
		INSERT INTO technicians VALUES (DEFAULT, t_fname, t_lname);
	END $$

DELIMITER ;

-- 2) Delete technician  | permission level: 4
--		(NOTE: DELETING A TECHNICIAN WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN A TECHNICIAN LEAVES EMPLOYMENT AT YOUR BUSINESS. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE technicians_delete_technician
	(
		t_fname VARCHAR(255),
		t_lname VARCHAR(255)
	)

	BEGIN
		DELETE FROM technicians
		WHERE 
			technicians.first_name = t_fname
			AND
			technicians.last_name = t_lname;
	END $$

DELIMITER ;

-- 3) Update technician | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE technicians_update_record
	(
		t_id INT,
		t_fname VARCHAR(50),
		t_lname VARCHAR(50)
	)

	BEGIN
		UPDATE technicians 
		SET
			technicians.first_name = t_fname,
			technicians.last_name = t_lname
		WHERE 
			technicians.tech_id = t_id;
	END $$

DELIMITER ;

-- test 1
-- CALL technicians_add_technician("test", "test1")
-- test 2
-- CALL technicians_delete_technician("test", "test1")
-- test 3
-- CALL technicians_update_record(1, "alter", "alter1")

-- ---------------------------------------------------------------------------------------------------
-- services table procedures

-- 1) Add service | permission level: 3

DELIMITER $$

CREATE PROCEDURE services_add_service
	(
		s_device_id INT,
		s_name VARCHAR(255),
		s_price DECIMAL(10,2),
		s_point_value INT
	)

	BEGIN
		INSERT INTO services VALUES (DEFAULT, s_device_id, s_name, s_price, s_point_value);
	END $$

DELIMITER ;

-- 2) Delete service  | permission level: 4
--		(NOTE: DELETING A SERVICE WILL DELETE ALL ASSOCIATED RECORDS THROUGHOUT YOUR DATABASE
-- 		ONLY USE THIS COMMAND IF ERRORS ARE MADE AT THE TIME OF INSERTION (ex. spelling errors), 
--		NOT WHEN A SERVICE IS DISCONTINUED. OTHERWISE, HISTORICAL DATA WILL BE LOST)

DELIMITER $$

CREATE PROCEDURE services_delete_service 
	(
		s_name VARCHAR(255)
	)

	BEGIN
		DELETE FROM services
		WHERE services.service_name = s_name;
	END $$

DELIMITER ;

-- 3) Update service | permission level: 3
-- 		(NOTE: THIS IS THE PREFERRED METHOD OF ALTERING RECORDS WITHIN THIS TABLE. IT WILL
-- 		NOT COMPROMISE HISTORICAL DATA BY DELETING ASSOCIATED RECORDS IN OTHER TABLES)

DELIMITER $$

CREATE PROCEDURE services_update_record
	(
		s_id INT,
		s_device_id INT,
		s_name VARCHAR(255),
		s_price DECIMAL(10,2),
		s_point_value INT
	)

	BEGIN
		UPDATE services 
		SET
			services.device_id = s_device_id,
			services.service_name = s_name,
			services.price = s_price,
			services.point_value = s_point_value
		WHERE 
			services.service_id = s_id;
	END $$

DELIMITER ;

-- test 1
-- CALL services_add_service(1, "test", 0.00, 100)
-- test 2 
-- CALL services_delete_service("test")
-- test 3 
-- CALL services_update_record(1, 1, "alter", 0.00, 150)

-- ---------------------------------------------------------------------------------------------------
-- tools_by_service table procedures 

-- 1) Add tool/service relationship | permission level: 3

DELIMITER $$

CREATE PROCEDURE tools_by_service_add_relationship
	(
		s_id INT,
		t_id INT
	)
	BEGIN
		INSERT INTO tools_by_service VALUES (s_id, t_id);
	END $$

DELIMITER ; 

-- 2) Delete tool/service relationship | permission level: 3

DELIMITER $$
	
CREATE PROCEDURE tools_by_service_delete_relationship
	(
		s_id INT,
		t_id INT
	) 
	
	BEGIN
		DELETE FROM tools_by_service
		WHERE 
			tools_by_service.service_id = s_id
			AND
			tools_by_service.tool_id = t_id;  
	END $$

DELIMITER ;

-- test 1
-- CALL tools_by_service_add_relationship(1, 4)
-- test 2 
-- CALL tools_by_service_delete_relationship(1, 4)

-- ---------------------------------------------------------------------------------------------------
-- parts_by_service table procedures

-- 1) Add part/service relationship | permission level: 3

DELIMITER $$

CREATE PROCEDURE parts_by_service_add_relationship
	(
		s_id INT,
		p_id INT
	)
	BEGIN
		INSERT INTO parts_by_service VALUES (s_id, p_id);
	END $$

DELIMITER ; 

-- 2) Delete part/service relationship | permission level: 3

DELIMITER $$
	
CREATE PROCEDURE parts_by_service_delete_relationship
	(
		s_id INT,
		p_id INT
	) 
	
	BEGIN
		DELETE FROM parts_by_service
		WHERE 
			parts_by_service.service_id = s_id
			AND
			parts_by_service.part_id = p_id;  
	END $$

DELIMITER ;

-- test 1
-- CALL parts_by_service_add_relationship(1, 4)
-- test 2 
-- CALL parts_by_service_delete_relationship(1, 4)

-- ---------------------------------------------------------------------------------------------------
-- tech_details table procedures

-- 1) Add technician personal details | permission level: 3

DELIMITER $$

CREATE PROCEDURE tech_details_add_details
	(
		t_id INT,
		birth DATE,
		hire DATE,
		t_points INT,
		home_street VARCHAR(50),
		home_city VARCHAR(50),
		home_state VARCHAR(2)

	)
	BEGIN
		INSERT INTO tech_details VALUES 
			(
				t_id, 
				birth, 
				hire, 
				t_points, 
				home_street, 
				home_city,
				home_state
			);
	END $$

DELIMITER ; 

-- 2) Edit technician personal details | permission level: 3

DELIMITER $$

CREATE PROCEDURE tech_details_edit_details
	(
		t_id INT,
		birth DATE,
		hire DATE,
		t_points INT,
		home_street VARCHAR(50),
		home_city VARCHAR(50),
		home_state VARCHAR(2)
	) 

	BEGIN
		UPDATE tech_details
		SET
			tech_details.dob = birth,
			tech_details.hire_date = hire,
			tech_details.points = t_points,
			tech_details.street = home_street,
			tech_details.city = home_city,
			tech_details.state = home_state
		WHERE 
			tech_details.tech_id = t_id;
	END $$

DELIMITER ;

-- 3) Add points to technician record | permission level: 3

DELIMITER $$

CREATE PROCEDURE tech_details_add_points
	(
		t_id INT,
		new_points INT
	)

	BEGIN
		UPDATE tech_details
		SET
			tech_details.points = (tech_details.points + new_points) 
		WHERE
			tech_details.tech_id = t_id;
	END $$

DELIMITER ;

-- test 1 (NOTE YOU MUST GENERATE A RECORD IN technicians TABLE WITH (tech_id = 8) BEFORE RUNNING THIS TEST)
-- CALL tech_details_add_details(8, "2000-01-01", "2001-01-01", 100, "test", "test1", "ts")
-- test 2
-- CALL tech_details_edit_details(1, "2000-01-01", "2001-01-01", 100, "test", "test1", "ts")
-- test 3
-- CALL tech_details_add_points(1, 100000)

-- ---------------------------------------------------------------------------------------------------
-- prof_by_tech table procedures

-- 1) Add technician proficiency | permission level: 3

DELIMITER $$

CREATE PROCEDURE prof_by_tech_add_proficiency
	(
		t_id INT,
		d_id INT
	)

	BEGIN
		INSERT INTO prof_by_tech VALUES (t_id, d_id);
	END $$

DELIMITER ;

-- 2) Delete technician proficiency | permission level: 3

DELIMITER $$
	
CREATE PROCEDURE prof_by_tech_delete_proficiency
	(
		t_id INT,
		d_id INT
	) 
	
	BEGIN
		DELETE FROM prof_by_tech
		WHERE 
			prof_by_tech.tech_id = t_id
			AND
			prof_by_tech.device_id = d_id;  
	END $$

DELIMITER ;

-- test 1
-- CALL prof_by_tech_add_proficiency(1, 4)
-- test 2 
-- CALL prof_by_tech_delete_proficiency(1, 4)

-- ---------------------------------------------------------------------------------------------------
-- customer_details table procedures

-- 1) Add customer details | permission level: 3

DELIMITER $$

CREATE PROCEDURE customer_details_add_details
	(
		c_id INT,
		c_points INT,
		c_city VARCHAR(50),
		c_state VARCHAR(2),
		c_birth DATE,
		c_since DATE
	)

	BEGIN
		INSERT INTO customer_details VALUES 
			(
				c_id, 
				c_points, 
				c_city, 
				c_state, 
				c_birth, 
				c_since
			);
	END $$

DELIMITER ;

-- 2) Edit customer details | permission level: 3

DELIMITER $$

CREATE PROCEDURE customer_details_edit_details
	(
		c_id INT,
		c_points INT,
		c_city VARCHAR(50),
		c_state VARCHAR(2),
		c_birth DATE,
		c_since DATE
	)

	BEGIN
		UPDATE customer_details
		SET
			customer_details.points = c_points,
			customer_details.city = c_city,
			customer_details.state = c_state,
			customer_details.dob = c_birth,
			customer_details.customer_since = c_since
		WHERE customer_details.customer_id = c_id;
	END $$

DELIMITER ; 

-- test 1 (NOTE YOU MUST GENERATE A RECORD IN customers TABLE WITH (customer_id = 8) BEFORE RUNNING THIS TEST)
-- CALL customer_details_add_details(8, 0, "test", "ts", "2000-01-01", "2001-01-01")
-- test 2
-- CALL customer_details_edit_details(1,  0, "test", "ts", "2000-01-01", "2001-01-01")

-- ---------------------------------------------------------------------------------------------------
-- client_devices table procedures

-- 1) Add client/device relationship | permission level: 3

DELIMITER $$

CREATE PROCEDURE client_device_add_relationship
	(
		c_id INT,
		d_id INT
	)
	BEGIN
		INSERT INTO client_devices VALUES (c_id, d_id, curdate());
	END $$

DELIMITER ; 

-- 2) Delete client/device relationship | permission level: 3

DELIMITER $$
	
CREATE PROCEDURE client_device_delete_relationship
	(
		c_id INT,
		d_id INT
	) 
	
	BEGIN
		DELETE FROM client_devices 
		WHERE 
			client_devices.customer_id = c_id
			AND
			client_devices.device_id = d_id;  
	END $$

DELIMITER ;

-- test 1
-- CALL client_device_add_relationship(1, 4)
-- test 2 
-- CALL client_device_delete_relationship(1, 4)

-- ---------------------------------------------------------------------------------------------------
-- service_orders table procedures

-- 1) Add service order | permission level: 3 

DELIMITER $$

CREATE PROCEDURE service_orders_place_order
	(
		c_id INT,
		t_id INT,
		s_id INT,
		placed DATETIME,
		s_location VARCHAR(255),
		sched DATETIME
	)

	BEGIN 
		INSERT INTO service_orders VALUES 
			(
				DEFAULT, 
				c_id,
				t_id,
				s_id,
				placed,
				s_location,
				sched
			);
	END $$

DELIMITER ;

-- 2) Edit service order | permission level: 3 

DELIMITER $$

CREATE PROCEDURE service_orders_edit_order
	(
		o_id INT,
		c_id INT,
		t_id INT,
		s_id INT,
		placed DATETIME,
		s_location VARCHAR(255),
		sched DATETIME
	)	

	BEGIN
		UPDATE service_orders
		SET
			service_orders.customer_id = c_id,
			service_orders.tech_id = t_id,
			service_orders.service_id = s_id,
			service_orders.date_time_placed = placed,
			service_orders.service_location = s_location,
			service_orders.date_time_scheduled = sched
		WHERE 
			service_orders.service_order_id = o_id;
	END $$

DELIMITER ;

-- test 1
-- CALL service_orders_place_order(1, 1, 1, "2000-01-01 06:00:00", "Home", "2000-01-01 06:00:00")
-- test 2
-- CALL service_orders_edit_order(2, 1, 1, 1, "2000-01-01 06:00:00", "Home", "2000-01-01 06:50:07")

-- ---------------------------------------------------------------------------------------------------
-- service_que table procedures  

-- 1) Add que item | permission level: 3

DELIMITER $$

CREATE PROCEDURE service_que_add_ticket
	(
		s_id INT
	)

	BEGIN
		INSERT INTO service_que VALUES 
			(
				DEFAULT, 
				s_id, 
				DEFAULT,
				NULL,
				NULL
			);
	END $$

DELIMITER ;

-- 2) Record ticket completion | permission level: 2 

DELIMITER $$

CREATE PROCEDURE service_que_ticket_completion
	(
		t_id INT,
		began DATETIME,
		completed DATETIME
	) 
	
	BEGIN
		UPDATE service_que
		SET
			service_que.completed = TRUE,
			service_que.date_time_began = began,
			service_que.date_time_completed = completed
		WHERE
			service_que.ticket_id = t_id;
	END $$

DELIMITER ;

-- test 1
-- CALL service_que_add_ticket(1)
-- test 2
-- CALL service_que_ticket_completion(1, "2001-01-01 00:00:00", NOW())



