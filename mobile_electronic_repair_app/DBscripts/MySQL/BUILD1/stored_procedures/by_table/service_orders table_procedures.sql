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