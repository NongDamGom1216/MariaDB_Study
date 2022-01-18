#python SQLite로 db관리하는 법(maridDB 아님)

import sqlite3

def main():
    #db 접속관리
    con = sqlite3.connect('addr.db') #DB파일이 없으면 새로 생성
    print('db 연결 성공')

    cursor = con.cursor() # SQL 실행

    #예전에 쓰고있던 테이블 지우기
    cursor.execute('DROP TABLE IF EXISTS tblAddr')

    cursor.execute("""
    CREATE TABLE tblAddr(
        name CHAR(16) PRIMARY KEY,
        phone CHAR(16),
        addr TEXT
    )
    """) #여기서의 TEXT는 길이제한이 없다.

    cursor.execute("INSERT INTO tblAddr VALUES('히나나', '123-123', '도쿄')")
    cursor.execute("INSERT INTO tblAddr VALUES('린제', '123-567', '교토')")
    cursor.execute("INSERT INTO tblAddr VALUES('아마나', '123-890', '신주쿠')")

    #200개의 테스트 데이터 insert 하기
    for ix in range(1, 201):
        sql = f"INSERT INTO tblAddr VALUES('텐카{ix:03}', '010-5100-{ix:04}', '오사카')"
        print(sql)
        cursor.execute(sql)
    
    con.commit()
    cursor.close()
    con.close()

main()