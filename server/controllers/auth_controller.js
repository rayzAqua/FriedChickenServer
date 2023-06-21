import Role from "../models/Role.js";
import User from "../models/User.js";
import getToken from "../utils/getToken.js";
import message from "../utils/message.js";
import { compare, encode } from "../utils/my-bcrypt.js";

class AuthController {
  //[POST] /account/sign-in
  async logIn(req, res, next) {
    try {
      const { username, password } = req.body;
      if (!username || !password) {
        return res.send(
          message(false, "Tên đăng nhập và mật khẩu không được để trống!", "")
        );
      }

      const user = await User.getByEmail(username);

      if (!user || user.length === 0 || !compare(password, user.password)) {
        return res.send(message(false, "Sai tên đăng nhập hoặc mật khẩu!", ""));
      }
      if (user.status != "active") {
        return res.send(
          message(false, "Tài khoản đã bị khóa không thể đăng nhập!", "")
        );
      }

      const listRole = await Role.getListRoleByUserId(user.userId);
      const token = getToken(user.email, listRole);
      res.setHeader("Authorization", token);
      res.setHeader("Access-Control-Expose-Headers", "*");
      return res.send(
        message(true, "Đăng nhập thành công!", [
          {
            role: listRole,
            name: user.name,
            image: user.image,
            userId: user.userId,
          },
        ])
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Đăng nhập thất bại!"));
    }
  }
  //[PATCH] /account/change-password
  async changePassword(req, res, next) {
    try {
      const { userId, email, username, newPassword, oldPassword } = req.body;
      if (!username)
        return res.send(
          message(false, "Tên đăng nhập v không được để trống!", [])
        );
      if (!oldPassword) {
        return res.send(message(false, "Mật khẩu cũ không được để trống!", []));
      }
      if (!newPassword) {
        return res.send(
          message(false, "Mật khẩu mới không được để trống!", [])
        );
      }

      if (email != username) {
        return res.send(message(false, "Tên đăng nhập không hợp lệ!", ""));
      }
      let user = await User.getByEmail(email);
      if (user.status != "active") {
        return res.send(
          message(false, "Tài khoản đã bị khóa không thể đổi mật khẩu!", "")
        );
      }
      if (!compare(oldPassword, user.password)) {
        return res.send(message(false, "Mật khẩu cũ không đúng!", []));
      }
      user = await User.updatePassword(userId, encode(newPassword));
      if (user["affectedRows"] < 1) {
        return res.send(message(false, "Đổi mật khẩu thất bại!"));
      }

      return res.send(message(true, "Đổi mật khẩu thành công!", []));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Đổi mật khẩu thất bại!"));
    }
  }
}

export default new AuthController();
