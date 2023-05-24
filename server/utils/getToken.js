import dotenv from "dotenv";
import jwt from "jsonwebtoken";
dotenv.config();

export default function getToken(email, role) {
  let minutes = 3600;

  const payload = {
    email,
    role,
    isa: Math.floor(Date.now() / 1000),
    exp: Math.floor(Date.now() / 1000) + 60 * minutes,
  };
  const secretKey = process.env.JWT_SECRET;
  const token = jwt.sign(payload, secretKey);

  return token;
}
