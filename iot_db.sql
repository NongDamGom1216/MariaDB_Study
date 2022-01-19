create user 'iot'@'%' identified by '1200';

grant all privileges on sqlDB.* to 'iot'@'%';

grant all privileges on iot_db.* to 'iot'@'%';