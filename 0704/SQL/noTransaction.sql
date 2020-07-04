delimiter //

DROP PROCEDURE IF EXISTS importCustomer;//
TRUNCATE TABLE customer;//

CREATE PROCEDURE importCustomer ()
	BEGIN
		insert into customer set name= 'Gin', money = 10000;
		insert into customer set name= 'Jimmy', money = 10;
		insert into customer set name= 'imerror', money = 'abc';
	END;
//

CALL importCustomer()//

SELECT * FROM BackendStudy.customer;//

-- insert into customer set name= 'imerror', money = 'abc';



