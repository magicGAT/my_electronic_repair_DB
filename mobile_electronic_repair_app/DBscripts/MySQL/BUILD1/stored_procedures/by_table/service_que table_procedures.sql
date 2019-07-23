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