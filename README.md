# Домашнее задание к занятию "`Репликация и масштабирование. Часть 1`" - `Николай Концевой`

---

### Задание 1

На лекции рассматривались режимы репликации master-slave, master-master, опишите их различия.

*Ответить в свободной форме.*



### Ответ 1

- master-slave - Master являетя ведущим сервером. На нем доступны все действия связаные с изменением данных (чтение, удаление, запись). Slave это ведомый сервер, точная копия мастера. Он копирует информацию с мастера путем чтения журнала логов на мастере. На Slave доступно только чтение данных, но при поломке основного сервера slave можно сделать мастером и в этом случае станет доступно изменение данных.

- master-master - оба сервера являются равноправными, копируют друг друга.

---


### Задание 2

Выполните конфигурацию master-slave репликации, примером можно пользоваться из лекции.

*Приложите скриншоты конфигурации, выполнения работы: состояния и режимы работы серверов.*

### Ответ 2

Установлены два контейнера в docker
![докер](https://github.com/Stitchzxz/homework_netology/blob/main/screen/docker_ps.png)

Статус Master:
![статус мастер](https://github.com/Stitchzxz/homework_netology/blob/main/screen/status_master.png)

Статус Slave:
![статус слейв](https://github.com/Stitchzxz/homework_netology/blob/main/screen/status_slave.png)

Создание новой базы на Master:
![новая база мастер](https://github.com/Stitchzxz/homework_netology/blob/main/screen/master-db.png)

Реплицированная новая база на Slave:
![новая база слейв](https://github.com/Stitchzxz/homework_netology/blob/main/screen/slave-db.png)

---

## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

---

### Задание 3* 

Выполните конфигурацию master-master репликации. Произведите проверку.

*Приложите скриншоты конфигурации, выполнения работы: состояния и режимы работы серверов.*