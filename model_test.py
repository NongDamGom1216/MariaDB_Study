from models import TblAddr
from database import con

# 전체 목록 얻기 테스트
book = TblAddr.all()
for a in book:
    print(a)

print("-"*50)

# 단일 데이터 추출
item = TblAddr.get('린제')
print(item)
item = TblAddr.get('텐카000')
print(item)

print("-"*50)

# insert 테스트
item = TblAddr('키리코', '010-5100-1234','교토')
item.insert()
item = TblAddr.get('키리코')
print(item)

print("-"*50)

# update 테스트
item.addr = '하라주쿠'
item.update()
item = TblAddr.get('키리코')
print(item)

print("-"*50)

# remove 테스트
item.remove()
item = TblAddr.get('키리코')
print(item) # None


con.close()