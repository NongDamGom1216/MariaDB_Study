from iot_models import Member

# all() 테스트
members = Member.all()
for m in members:
    print(f'{m.userid} {m.name} {m.email}')

print("-"*50)

# get() 테스트
user = Member.get('hinana')
print(user)

print("-"*50)

# login() 테스트
user = None
user = Member.login('hinana', '1234')
if user:
    print(f"로그인 성공 : {user.userid} {user.name}")
else:
    print("로그인 실패")

print("-"*50)

# input()을 사용하여 로그인, 최대 3번까지 입력
input_count = 0
while(input_count < 3):
    userid = input("아이디 : ")
    password = input("비밀번호 : ")
    user = None
    user = Member.login(userid, password)
    if user:
        break
    else:
        print("다시 시도하세요.")
        input_count += 1

if user:
    print(f"로그인 성공 : {user.userid} {user.name}")
else:
    print("로그인 실패")