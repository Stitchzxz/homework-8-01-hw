

#1 задание
SELECT sf.store_id AS 'Магазин №', 
       CONCAT(sf.last_name, ' ', sf.first_name) AS 'ФИО манагера',
       c.city AS 'Город', COUNT(cu.customer_id) AS 'Кол-во юзеров'
from store sr 
JOIN staff sf ON sf.store_id = sr.store_id
JOIN address a ON a.address_id = sr.address_id 
JOIN city c ON c.city_id = a.city_id 
JOIN customer cu ON cu.store_id = sr.store_id 
GROUP BY sf.staff_id, c.city_id 
having COUNT(cu.customer_id) > 300;



#2 Задание
SELECT COUNT(`length`) AS "Кол-во фильмов длинее среднего"
FROM film
WHERE `length` > (SELECT AVG(`length`) FROM film) 
                    



#3 Задание
select DATE_FORMAT(payment_date, '%M %Y') AS 'Самый прибыльный месяц', 
       sum(amount) AS 'Сумма платежей', count(rental_id) AS 'Кол-во аренд'
from payment p 
group by DATE_FORMAT(payment_date, '%M %Y')
order by sum(payment_date) desc
limit 1



