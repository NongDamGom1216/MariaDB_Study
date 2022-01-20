from dataclasses import dataclass
from datetime import datetime
from iot_mariaDB import con

@dataclass
class Member:
    userid: str
    password: str
    name: str
    email: str
    phone: str
    birth: datetime
    gender: str
    address: str
    create_date: datetime
    update_date: datetime

    @classmethod
    def all(cls):
        sql = 'select * from members'
        cursor = con.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        result = list(map(lambda r: cls(*r), result)) #튜플에 대한 값을 리스트로 변환
        cursor.close()
        return result
    
    @classmethod
    def get(cls, pk): # 키 값으로 한 개만 가져옴
        cursor = con.cursor()
        sql = f"select * from members where userid = '{pk}'" # """ 써도 실행됨 
        cursor.execute(sql)
        record = cursor.fetchone()
        if record: #존재하면 모델 클래스 인스턴스로 변환
            record = cls(*record)
        
        cursor.close()
        return record
    
    # 메서드명: login
    # 매개변수: userid, password
    # 매개변수로 전달받은 userid의 password가 일치하면 로그인
    # 로그인 실패하면 None
    # 호출한 쪽에서 로그인 성공 여부를 출력

    @classmethod
    def login(cls, userid, password):
        cursor = con.cursor()
        sql = f"select * from members where userid = '{userid}' and password = password('{password}')"
        cursor.execute(sql)
        record = cursor.fetchone()
        if record: #존재하면 모델 클래스 인스턴스로 변환
            record = cls(*record)

        cursor.close()
        return record

