#fetchone 사용법

import sqlite3
from models import TblAddr

def main():
    #db 접속관리
    con = sqlite3.connect('addr.db') #DB파일이 없으면 새로 생성
    cursor = con.cursor() # SQL 실행

    cursor.execute("SELECT * FROM tblAddr WHERE name = '히나나'") # 메모리에 저장
    record = cursor.fetchone() 

    if record:
        record = TblAddr(*record)
        print(f"히나나는 {record.addr}에 살고 있습니다.")
    else:
        print("히나나는 없는 이름입니다.")
    
    cursor.close()
    con.close()

main()