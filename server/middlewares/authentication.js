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

    if (decoded.role.length == 0) {
      return res.send(message(false, "Không có quyền truy cập", ""));
    }

    let checkRole = false;
    decoded.role.map((role) => {
      if (role.roleId == 1) {
        checkRole = true;
      }
    });

    if (!checkRole) {
      return res.send(message(false, "Không có quyền truy cập", ""));
    }

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

async function checkRoleManage(req, res, next) {
  const token = req.headers["authorization"] || req.query.token;
  if (!token) {
    return res.send(message(false, "Không có quyền truy cập!", ""));
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    if (decoded.role.length == 0) {
      return res.send(message(false, "Không có quyền truy cập", ""));
    }
    let checkRole = false;
    decoded.role.map((role) => {
      if (role.roleId == 1) {
        checkRole = true;
      }
    });

    if (!checkRole) {
      return res.send(message(false, "Không có quyền truy cập", ""));
    }

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

export { authenticateToken, checkRoleManage };
