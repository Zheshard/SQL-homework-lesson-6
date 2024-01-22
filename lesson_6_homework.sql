/* 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

2.	 Создайте процедуру, которая  выводит только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)*/


CREATE DATABASE homework6;
USE homework6;

-- Задание 1
DROP FUNCTION formatting_seconds;
DELIMITER $$
CREATE FUNCTION formatting_seconds(n INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE sec INT DEFAULT n;
	DECLARE minutes INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE days INT DEFAULT 0;
	DECLARE result VARCHAR(50);
    
    SET sec = n % 60;
    SET n = FLOOR(n / 60);
    
    SET minutes = n % 60;
    SET n = FLOOR(n / 60);
    
    SET hours = n % 24;
    SET days = FLOOR(n / 24);
	
    SET result = CONCAT(days,' days ',hours,' hours ',minutes,' minutes ',sec,' seconds');
    RETURN result;
END $$
DELIMITER ;

SELECT formatting_seconds(123456);

-- Задание 2
DROP PROCEDURE prints_even_numbers;
DELIMITER //
CREATE PROCEDURE prints_even_numbers(n INT)
BEGIN
	DECLARE result VARCHAR(50) DEFAULT ' ';
    DECLARE i INT DEFAULT 0;
	WHILE i < n DO
		SET i = i + 2;
		SET result = CONCAT(result,' ', i);
	END WHILE;
	SELECT result AS 'result';
END //
DELIMITER ;

CALL prints_even_numbers(10);