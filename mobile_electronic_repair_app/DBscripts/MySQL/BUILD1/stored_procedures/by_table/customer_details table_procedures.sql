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