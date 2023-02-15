# Systemd.
## Задачи:
- Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в `/etc/sysconfig`.
- Из репозитория `epel` установить `spawn-fcgi` и переписать init-скрипт на unit-файл (имя service должно называться так же: `spawn-fcgi`).
- Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.

Реализовано развёртывание результата выполнения с использованием Vagrant и Vagrant shell provisioner.

Особенности:
1. По умолчанию, сервис мониторинга ищет `warn` в `/var/log/messages`.
2. Во втором конфигурационном файле apache2 `httpd-second`, в директиве `Listen` указан "разрешённый" SELinux'ом порт `8080`. Поэтому в отключении SELinux в данной ОС не было необходимости.
