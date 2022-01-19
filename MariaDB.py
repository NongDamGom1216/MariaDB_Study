import pymysql
import sys
pymysql.install_as_MySQLdb()

try:
    con = pymysql.connect(db='iot_DB', host='localhost', user='iot', passwd = '1200')
    print("데이터베이스 연결 성공")
    # con = sqlite3.connect('addr.db')
except Exception as e:
    print('데이터베이스 연결에 실패했습니다.')
    print(e)
    sys.exit(0)

cursor = con.cursor()
cursor.execute('DROP TABLE IF EXISTS tblAddr')
cursor.execute("""
    CREATE TABLE tblAddr(
        name CHAR(16) PRIMARY KEY,
        phone CHAR(16),
        addr TEXT
    )
    """) #여기서의 TEXT는 길이제한이 없다.
cursor.execute("INSERT INTO tblAddr VALUES('무지', '123-123', '도쿄')")
cursor.execute("INSERT INTO tblAddr VALUES('어피치', '123-567', '교토')")
cursor.execute("INSERT INTO tblAddr VALUES('농담곰', '123-890', '신주쿠')")

con.commit() #update, delete, insert에서 필수
cursor.close()
con.close()
