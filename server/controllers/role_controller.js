import Role from "../models/Role.js";
import message from "../utils/message.js";

class RoleController {
  //[GET] /role/list
  async getList(req, res, next) {
    try {
      const role = await Role.getListRole();
      return res.send(message(false, "Lấy dữ liệu thành công!", role));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new RoleController();
