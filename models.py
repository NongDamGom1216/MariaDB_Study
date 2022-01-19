#model class 정의

from dataclasses import dataclass
from database import con

# 데이터베이스를 위한 모델 클래스명
# 클래스명의 단수형과 일치
# 파스칼 표기볍
@dataclass
class TblAddr:
    name: str
    phone: str
    addr: str

    # CRUD
    def insert(self):
        sql = f"""insert into tblAddr values('{self.name}', '{self.phone}', '{self.addr}')"""
        cursor = con.cursor()
        cursor.execute(sql)
        con.commit()
        cursor.close()

    # select는 인스턴스와 무관 --> @staticmethod, @classmethod
    @classmethod
    def all(cls): # 전체를 가져옴
        cursor = con.cursor()
        sql = f'select * from tblAddr'
        cursor.execute(sql)
        records = cursor.fetchall()
        records = list(map(lambda r: cls(*r), records))

        cursor.close()
        return records

    @classmethod
    def get(cls, pk): # 키 값으로 한 개만 가져옴
        cursor = con.cursor()
        sql = f"select * from tblAddr where name = '{pk}'" # """ 써도 실행됨 
        cursor.execute(sql)
        record = cursor.fetchone()
        if record: #존재하면 모델 클래스 인스턴스로 변환
            record = cls(*record)
        
        cursor.close()
        return record
        
    def update(self):
        cursor = con.cursor()
        sql = f"""
        update tblAddr
        set 
            phone = '{self.phone}',
            addr = '{self.addr}'
        where name = '{self.name}'
        """
        cursor.execute(sql)
        con.commit()
        cursor.close()     

    def remove(self):
        cursor = con.cursor()
        sql = f"""delete from tblAddr where name = '{self.name}' """
        cursor.execute(sql)
        con.commit()
        cursor.close()

if __name__ == '__main__':
    record = ('시오리코', '010-5100-3557','도쿄')

    print(record) # 매개변수의 개수 1개(튜플)
    print(*record) # 매개변수 3개(콜렉션의 요소 수만큼 전달)

    a = TblAddr(*record) # TblAddr('시오리코', '010-5100-3557','도쿄')과 같다.
    print(a)