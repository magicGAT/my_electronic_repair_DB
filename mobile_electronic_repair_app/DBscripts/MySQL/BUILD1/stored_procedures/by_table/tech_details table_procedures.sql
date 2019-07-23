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