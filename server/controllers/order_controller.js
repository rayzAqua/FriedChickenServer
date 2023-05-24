import Customer from "../models/Customer.js";
import Order from "../models/Order.js";
import OrderDetail from "../models/OrderDetail.js";
import message from "../utils/message.js";

class OrderController {
  //[GET] /order/list
  async getList(req, res, next) {
    const orderId = req.query.orderId ? req.query.orderId : "";

    if (orderId != "") {
      const order = await Order.getOrderById(orderId);

      if (order.length == 0) {
        return res.send(message(false, "Không tồn tại đơn hàng này!", ""));
      }

      const customer = await Customer.getById(order[0].customerId);

      const orderDetail = await OrderDetail.getByOrderId(order[0].orderId);

      return res.send(
        message(true, "Lấy dữ liệu thành công!", [
          { order: order[0], customer: customer[0], details: orderDetail },
        ])
      );
    }
    return;
  }
}

export default new OrderController();
