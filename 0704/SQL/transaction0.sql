delimiter //

DROP PROCEDURE IF EXISTS importCustomerWithTransaciton;//
TRUNCATE TABLE customer;//

CREATE PROCEDURE importCustomerWithTransaciton ()
	BEGIN
		DECLARE exit handler for sqlexception BEGIN ROLLBACK; END;
		DECLARE exit handler for sqlwarning BEGIN ROLLBACK; END;
        START TRANSACTION;
			insert into customer set name= 'Gin2', money = 10000;
			insert into customer set name= 'Jimmy2', money = 10;
			insert into customer set name= 'imerror2', money = 'abc';
		COMMIT;
	END;
// 

CALL importCustomerWithTransaciton()//

SELECT * FROM BackendStudy.customer;//


