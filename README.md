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

module.exports = {
  cryptoCipheriv,
  cryptoDecipheriv,
};
