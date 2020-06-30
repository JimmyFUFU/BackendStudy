delimiter //

DROP PROCEDURE IF EXISTS rollbackToSavePoint;//
TRUNCATE TABLE customer;//

CREATE PROCEDURE rollbackToSavePoint ()
	BEGIN
		DECLARE exit handler for sqlexception BEGIN ROLLBACK to firstsavepoint; END;
		DECLARE exit handler for sqlwarning BEGIN ROLLBACK; END;
        START TRANSACTION;
			insert into customer set name= 'Gin', money = 10000;
            SAVEPOINT firstsavepoint;
			insert into customer set name= 'Jimmy', money = 10;
            
			insert into customer set name= 'imerror2', money = 'abc';
		COMMIT;
	END;
// 

CALL rollbackToSavePoint()//

SELECT * FROM BackendStudy.customer;//