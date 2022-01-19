# connection을 모듈화하여 전역변수로 사용
import sqlite3, sys

try:
    con = sqlite3.connect('addr.db')
except Exception as e:
    print('데이터베이스 연결에 실패했습니다.')
    print(e)
    sys.exit(0)

