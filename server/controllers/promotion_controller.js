import Promote from "../models/Promote.js";
import message from "../utils/message.js";

class PromotionController {
  //[GET] /promotion/list
  async list(req, res, next) {
    try {
      const promotions = await Promote.getAll();
      return res.send(message(true, "Lấy dữ liệu thành công!", promotions));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!"));
    }
  }
}

export default new PromotionController();
