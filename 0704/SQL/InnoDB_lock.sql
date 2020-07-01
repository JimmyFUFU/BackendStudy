Set autocommit=0;

SELECT * FROM product WHERE title = '西裝' FOR UPDATE;

commit;

unlock tables;

UPDATE product SET title = '西裝123' WHERE title = '西裝';

SELECT * FROM BackendStudy.product;

select @@autocommit;