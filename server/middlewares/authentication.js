import jwt from "jsonwebtoken";
import User from "../models/User.js";
import message from "../utils/message.js";
async function authenticateToken(req, res, next) {
  const token = req.headers["authorization"] || req.query.token;
  if (!token) {
    return res.send(message(false, "Không có quyền truy cập!", ""));
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.getByEmail(decoded.email);
    req.body = { ...decoded, ...req.body, ...user.userId };
    next();
  } catch (error) {
    if (error.message == "jwt expired") {
      return res.send(message(false, "Token đã hết hạn", ""));
    }
    return res.send(message(false, "Token không hợp lệ", ""));
  }
}

export { authenticateToken };
