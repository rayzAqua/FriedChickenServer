import message from "../utils/message.js";
// const connection = require("../utils/connection");

import { encode, compare } from "../utils/my-bcrypt.js";
class AccountControllers {
  async signIn(req, res) {
    try {
      let { username, password } = req.body;
      console.log(req.body);
      console.log("sign-in: " + username + " " + password);

      //check valid data form
      if (!username || !password) {
        return res.send(
          message("", false, "Tên đăng nhập và mật khẩu không được để trống!")
        );
      }

      console.log("encode(password): ", encode(password));
      //check valid account
      let [rows, fields] = await connection.execute(
        `select * from user where email ='${username}');`
        // `select * from account where username= '${username}'`
      );

      console.log("rows: ", rows);

      if (rows[0].length == 0 || !compare(password, rows[0][0].password)) {
        return res.send(message("", false, "Sai tên đăng nhập hoặc mật khẩu!"));
      }

      //check ative user

      const [rows2, fields2] = await connection.execute(
        `select roleId from userrole where roleId = '${username}';`
      );

      const { name, imageUrl, phoneNumber, email, address } = rows[0][0];
      let id = rows[0][0].idStaff;
      if (role == "customer") {
        id = rows[0][0].idCustomer;
      }
      //set token for client
      const token = getToken(username, false, role);
      const refreshToken = getRefeshToken(username, role);
      res.setHeader("Authorization", token);
      res.setHeader("Access-Control-Expose-Headers", "*");
      console.log("Đăng nhập thành công");
      return res.send(
        message(
          {
            id,
            name,
            imageUrl,
            role,
            phoneNumber,
            email,
            address,
            refreshToken,
          },
          true,
          "Đăng nhập thành công"
        )
      );
    } catch (error) {
      console.log(error);
      return res.send(message(error, false, "Đăng nhập thất bại do có lỗi!"));
    }
  }
}
export default new AccountControllers();
