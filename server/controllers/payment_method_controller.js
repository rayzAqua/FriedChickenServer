import PaymentMethod from "../models/PaymentMethod.js";
import message from "../utils/message.js";

class PaymentMethodController {
  //[GET] /payment-method/list
  async list(req, res, next) {
    try {
      const paymentMethods = await PaymentMethod.getAll();
      return res.send(message(true, "Lấy dữ liệu thành công!", paymentMethods));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!"));
    }
  }
}

export default new PaymentMethodController();
