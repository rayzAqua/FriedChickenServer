import jwt from "jsonwebtoken";
import User from "../models/User.js";
import message from "../utils/message.js";
async function authenticateToken(req, res, next) {
  const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InR1YW5raWV0MkBnbWFpbC5jb20iLCJyb2xlIjpbeyJyb2xlSWQiOjEsIm5hbWUiOiJRdeG6o24gbMO9In1dLCJpc2EiOjE2ODcwOTExMjksImV4cCI6MTY4NzMwNzEyOSwiaWF0IjoxNjg3MDkxMTI5fQ.XADsy67ZrSBkx9MYvRTdXXbv1zQO7PUybjUEaMomSLI"; //req.headers["authorization"] || req.query.token;
  if (!token) {
    return res.send(message(false, "Không có quyền truy cập!", ""));
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.getByEmail(decoded.email);

    if (user.length == 0) {
      return res.send(message(false, "Token không hợp lệ", ""));
    }
    const userId = user.userId;
    req.body = { ...decoded, ...req.body, userId };

    next();
  } catch (error) {
    if (error.message == "jwt expired") {
      return res.send(message(false, "Token đã hết hạn", ""));
    }
    return res.send(message(false, "Token không hợp lệ", ""));
  }
}

export { authenticateToken };
