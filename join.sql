tomers`.`snum` на первичный ключ `salespeaple`.`snum` */
SELECT 
    cname as 'имя покупателя', sname as 'имя продовца'
FROM
    shop.customers,
    `shop`.`salespeaple`
WHERE
     `customers`.`snum` =`salespeaple`.`snum`;


/*'естественное' соединение трех таблиц*/
SELECT 
    `customers`.`cname`,
    `salespeaple`.`sname`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    shop.sales,
    shop.customers,
    `shop`.`salespeaple`
WHERE 
`sales`.`snum` = `salespeaple`.`snum` and sales.cnum=customers.cnum;


/*'не естественное' соединение таблиц (без использования ключевых полей)*/
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city;

/*составные условия при соединении*/
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city and customers.city = 'новосибирск';

/*составные условия при соединении*/
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city
        AND customers.city In ( 'новосибирск', 'омск');
	        
	       /*использование неравинств при соединениях */ 
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city < salespeaple.city
        AND rating = 200;

	/*использование псевдонима (alias) для таблиц*/
/*соединение одной таблицы с собой*/
SELECT 
    `first`.cname, `second`.cname, `first`.rating
FROM
    customers `first`,
    customers `second`
WHERE
    `first`.rating = `second`.rating and `first`.cname < `second`.cname;
    
/*псевдонимы для разных стаблиц*/
SELECT 
    b.cname as 'покупатель', a.sname as 'продавец', b.rating as 'рейтинг покупатля'
FROM
    salespeaple a,
    customers b
WHERE
	a.snum = b.snum;

	/*самосоединене для таблицы с циклической зависимостью*/
select f.empno, f.empname, s.empname 
from 
employee f, 
employee s
where
 f.manager = s.empno;

















