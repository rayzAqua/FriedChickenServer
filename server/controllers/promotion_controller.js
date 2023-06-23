import Promote from "../models/Promote.js";
import calculateStart, { calculateTotal } from "../utils/calculateStart.js";
import message from "../utils/message.js";
import { sendNewPromotion } from "../utils/sendMailNewPromotion.js";

class PromotionController {
  //[GET] /promotion/list
  async list(req, res, next) {
    const page = req.query.page || -1;
    const key = req.query.key || "";
    try {
      let promotions;
      promotions = await Promote.getAll(key);
      if (page == -1) {
        promotions.map((promotion) => {
          promotion["createUser"] = promotion["userName"];
          delete promotion["userName"];
        });
        return res.send(message(true, "Lấy dữ liệu thành công!", promotions));
      }

      const totalPage = calculateTotal(promotions.length);
      promotions = await Promote.getFollowPage(key, calculateStart(page));
      promotions.map((promotion) => {
        promotion["createUser"] = promotion["userName"];
        delete promotion["userName"];
      });
      return res.send(
        message(
          true,
          "Lấy dữ liệu thành công!",
          promotions,
          true,
          +page,
          totalPage
        )
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!"));
    }
  }

  //[POST] /promotion/add
  async add(req, res, next) {
    const name = req.body.name || "";
    const discount = req.body.discount || -1;
    const requirePoint = req.body.requirePoint || -1;
    const userId = req.body.userId;
    try {
      if (name == "") {
        return res.send(message(false, "Không được để trống tên khuyến mãi!"));
      }
      if (+discount < 1) {
        return res.send(message(false, "Giảm giá phải lớn hơn 0!"));
      }
      if (+requirePoint < 1) {
        return res.send(message(false, "Điểm phải lớn hơn 0!"));
      }

      const promotions = await Promote.create(
        name,
        +discount,
        +requirePoint,
        userId
      );
      const promotion = await Promote.getById(promotions["last_insert_id()"]);
      sendNewPromotion(promotion[0]);
      return res.send(message(true, "Thêm khuyến mãi thành công!", promotion));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Thêm khuyến mãi thất bại!"));
    }
  }
}

export default new PromotionController();
