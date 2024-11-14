
/*Подзапросы */
/*Простейшая форма подзапроса  - сравнение нужного значения с результатом выполнения подзапроса
Подзапрос должен возвращать customers единственное значение*/
SELECT 
    *
FROM
    sales
WHERE
    snum = (SELECT 
	            snum
		        FROM
			            salespeaple
				        WHERE
					            sname = 'Петров');
					/*Вместо "=" использовать "IN" из-за множеств*/
SELECT 
    *
FROM
    sales
WHERE
    snum IN (SELECT 
	            snum
		        FROM
			            salespeaple
				        WHERE
					            sname = 'Петров');

					SELECT 
					    *
					FROM
					    sales
					WHERE
					    snum IN (SELECT 
						            snum
							        FROM
								            salespeaple
									        WHERE
										            city = 'Тверь');

										/*Список продаж покупателей с номером "201"*/

SELECT 
    amount, sdate, salespeaple.snum, salespeaple.sname
FROM
    sales natural join salespeaple
WHERE
    snum IN (SELECT 
	            snum
		        FROM
			            sales
				        WHERE
					            cnum = '201');

					/*Комиссионные продавцов, обслуживающие покупателей из "Санкт-Петербург"а*/

SELECT 
    comm
FROM
    salespeaple
WHERE
    snum IN (SELECT 
	            snum
		        FROM
			            customers
				        WHERE
					            city = 'Санкт-Петербург');
					            
					/*Использование агрегатных функций в подзапросах*/

SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
	            AVG(amount)
		        FROM
			            sales
				        WHERE
					            sdate = '2024-09-12');

					/*Пример использования выражений в подзапросе*/

SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
	            500 + AVG(amount)
		        FROM
			            sales
				        WHERE
					            sdate = '2024-09-12' and sdate < ('2024-09-12' + interval 15 DAY));

					/*Подзапросы в предложении HAVING*/
/*Находим, сколько групп покупателей имеют рейтинги больше, чем рейтинг по "Новосибирск"у*/
SELECT 
    rating, COUNT(DISTINCT cnum)
FROM
    customers
GROUP BY rating
HAVING rating > (SELECT 
	        AVG(rating)
		    FROM
		        customers
			    WHERE
			        city = 'Новосибирск');



