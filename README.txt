brew install mariadb
sudo mariadb-secure-installation

샘플 Employees 데이터베이스1
http://download.hanbit.co.kr/mariadb/10.3/employees.zip

cd \employees
mysql -u root -p
source employees.sql

샘플 데이터베이스2
http://download.hanbit.co.kr/mariadb/10.3/ -> sqlDB.sql
cd \employees
mysql -u root -p
source sqlDB.sql