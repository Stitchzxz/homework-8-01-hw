

#1 задание
SELECT DISTINCT district AS Район 
from address
where district LIKE 'K%a' AND district NOT LIKE '% %';



#2 Задание
SELECT amount AS Платеж, CAST(payment_date AS DATE) AS Дата_платежа
FROM payment
WHERE amount > 10 AND payment_date BETWEEN '2005-06-15 00:00:00' AND '2005-06-18 23:59:59'
ORDER BY Дата_платежа ASC;





#3 Задание
SELECT rental_id AS Аренда, rental_date AS Дата_аренды, inventory_id AS Инвентарный_номер, customer_id AS Клиент, return_date AS Дата_возврата, staff_id AS Данные_менеджера
FROM rental
ORDER BY Дата_аренды DESC
LIMIT 5;


#4 Задание
SELECT active AS Статус_клиента, LOWER(REPLACE (first_name, 'LL', 'PP')) AS Имя, LOWER(last_name) AS Фамилия
from customer
where (first_name LIKE 'Kelly' OR first_name LIKE 'Willie') AND active NOT LIKE '0';


