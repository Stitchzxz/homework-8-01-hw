# Домашнее задание к занятию "`Базы данных`" - `Николай Концевой`

---

### Легенда

Заказчик передал вам [файл в формате Excel](https://github.com/netology-code/sdb-homeworks/blob/main/resources/hw-12-1.xlsx), в котором сформирован отчёт. 

На основе этого отчёта нужно выполнить следующие задания.

### Задание 1

Опишите не менее семи таблиц, из которых состоит база данных:

- какие данные хранятся в этих таблицах;
- какой тип данных у столбцов в этих таблицах, если данные хранятся в PostgreSQL.

Приведите решение к следующему виду:

Сотрудники (

- идентификатор, первичный ключ, serial,
- фамилия varchar(50),
- ...
- идентификатор структурного подразделения, внешний ключ, integer).

### Ответ 1.

1. Сотрудники
- employee_id, первичный ключ, serial,
- employee_name, varchar(50),
- salary, numeric
- position_id, внешний ключ, integer,
- division_type_id, внешний ключ, integer,
- division_id, внешний ключ, integer,
- date (дата зачисления в штат), date,
- region_id, внешний ключ, integer
- city_id, внешний ключ, integer
- address_id, внешний ключ, integer
- project, varchar(150)

2. Тип подразделения
- division_type_id, первичный ключ, serial,
- division_type_name, varchar(150)

3. Структурное подразделение
- division_id, первичный ключ, serial,
- division_name, varchar(150)

4. Должность сотрудника
- position_id, первичный ключ, serial,
- position_name, varchar(150)

5. Регион
- region_id, первичный ключ, serial,
- region_name, varchar(150)

6. Город
- city_id, первичный ключ, serial,
- city_name, varchar(150)

7. Адрес филиала
- address_id, первичный ключ, serial,
- address_name, varchar(150)


![табл 1](https://github.com/Stitchzxz/homework_netology/blob/main/screen/table-1.png)
![табл 2,3,4,5,6,7](https://github.com/Stitchzxz/homework_netology/blob/main/screen/table-2.png)

## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.


### Задание 2*

Перечислите, какие, на ваш взгляд, в этой денормализованной таблице встречаются функциональные зависимости и какие правила вывода нужно применить, чтобы нормализовать данные.

...