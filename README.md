# Gapost


const crypto = require("crypto");

const cryptoCipheriv = (
  secertValue,
  secret = "SK hynix License By Digital Platform",
  secretiv
) => {
  try {
    const secretKey = crypto
      .createHash("sha256")
      .update(String(secret))
      .digest("base64")
      .substr(0, 32);

    const key = Buffer.from(secretKey, "utf8");
    const iv = secretiv || Buffer.from(secretKey.slice(0, 16));
    const cipher = crypto.createCipheriv("aes-256-cbc", key, iv);
    let result = cipher.update(secertValue, "utf8", "base64");
    return (result += cipher.final("base64"));
  } catch (e) {
    return secertValue;
  }
};

const cryptoDecipheriv = (secertValue, secretiv) => {
  try {
    const secretKey = crypto
      .createHash("sha256")
      .update("SK hynix License By Digital Platform")
      .digest("base64")
      .substr(0, 32);
    const key = Buffer.from(secretKey, "utf8");
    const iv = secretiv || Buffer.from(secretKey.slice(0, 16));
    const decipher = crypto.createDecipheriv("aes-256-cbc", key, iv);
    let result = decipher.update(secertValue, "base64", "utf8");
    return (result += decipher.final("utf8"));
  } catch (e) {
    console.log(e);
    return secertValue;
  }
};


from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
import base64

def generate_secret_key(secret):
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(secret.encode('utf-8'))
    return digest.finalize()[:32]

def crypto_cipheriv(secret_value, secret="SK hynix License By Digital Platform", secretiv=None):
    try:
        secret_key = generate_secret_key(secret)
        iv = secretiv or secret_key[:16]
        cipher = Cipher(algorithms.AES(secret_key), modes.CBC(iv), backend=default_backend())
        encryptor = cipher.encryptor()
        padded_value = secret_value + (16 - len(secret_value) % 16) * chr(16 - len(secret_value) % 16)
        encrypted = encryptor.update(padded_value.encode('utf-8')) + encryptor.finalize()
        return base64.b64encode(encrypted).decode('utf-8')
    except Exception as e:
        print(f"Encryption error: {e}")
        return secret_value

def crypto_decipheriv(secret_value, secretiv=None, secret="SK hynix License By Digital Platform"):
    try:
        secret_key = generate_secret_key(secret)
        iv = secretiv or secret_key[:16]
        cipher = Cipher(algorithms.AES(secret_key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        decoded_value = base64.b64decode(secret_value)
        decrypted = decryptor.update(decoded_value) + decryptor.finalize()
        padding_length = decrypted[-1]
        return decrypted[:-padding_length].decode('utf-8')
    except Exception as e:
        print(f"Decryption error: {e}")
        return secret_value

# Example Usage
encrypted = crypto_cipheriv("Hello, World!")
print("Encrypted:", encrypted)

decrypted = crypto_decipheriv(encrypted)
print("Decrypted:", decrypted)


module.exports = {
  cryptoCipheriv,
  cryptoDecipheriv,
};

from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.backends import default_backend
import base64

def generate_secret_key(secret):
    # 주어진 secret을 SHA256 해시로 변환하여 32바이트 키 생성
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(secret.encode('utf-8'))
    return digest.finalize()[:32]

def crypto_cipheriv(secret_value, secret="SK hynix License By Digital Platform", secretiv=None):
    try:
        secret_key = generate_secret_key(secret)
        iv = secretiv or secret_key[:16]
        cipher = Cipher(algorithms.AES(secret_key), modes.CBC(iv), backend=default_backend())
        encryptor = cipher.encryptor()
        
        # PKCS7 패딩 추가
        padded_value = secret_value + (16 - len(secret_value) % 16) * chr(16 - len(secret_value) % 16)
        encrypted = encryptor.update(padded_value.encode('utf-8')) + encryptor.finalize()
        return base64.b64encode(encrypted).decode('utf-8')
    except Exception as e:
        print(f"Encryption error: {e}")
        return secret_value

def crypto_decipheriv(secret_value, secretiv=None, secret="SK hynix License By Digital Platform"):
    try:
        secret_key = generate_secret_key(secret)
        iv = secretiv or secret_key[:16]
        
        # 복호화
        cipher = Cipher(algorithms.AES(secret_key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        
        # Base64로 인코딩된 값을 디코딩
        decoded_value = base64.b64decode(secret_value)
        decrypted = decryptor.update(decoded_value) + decryptor.finalize()
        
        # PKCS7 패딩 제거
        padding_length = decrypted[-1]
        return decrypted[:-padding_length].decode('utf-8')
    except Exception as e:
        print(f"Decryption error: {e}")
        return secret_value

# Example Usage
encrypted = crypto_cipheriv("Hello, World!")  # 암호화
print("Encrypted:", encrypted)

decrypted = crypto_decipheriv(encrypted)  # 복호화
print("Decrypted:", decrypted)
