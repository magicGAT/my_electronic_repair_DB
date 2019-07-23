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