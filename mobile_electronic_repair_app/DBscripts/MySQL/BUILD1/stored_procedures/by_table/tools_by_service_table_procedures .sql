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