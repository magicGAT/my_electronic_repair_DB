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