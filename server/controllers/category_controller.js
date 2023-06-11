import Category from "../models/Category.js";
import message from "../utils/message.js";

class CategoryController {
  //[GET] /category/list
  async getList(req, res, next) {
    try {
      const category = await Category.getList();

      res.send(message(true, "Lấy dữ liệu thành công!", category));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new CategoryController();
