import Customer from "../models/Customer.js";
import Order from "../models/Order.js";
import OrderDetail from "../models/OrderDetail.js";
import { calculateTotal } from "../utils/calculateStart.js";
import message from "../utils/message.js";

async function getDetailOrder(res, result, page, totalPage) {
  const detailPromises = [];
  const customerPromises = [];

  // Loop through each tour order and call Tour.getById() for its ID
  result.forEach((order) => {
    detailPromises.push(OrderDetail.getByOrderId(order.orderId));
    customerPromises.push(Customer.getById(order.customerId));
  });

  try {
    const [detailResponses, customerResponses] = await Promise.all([
      Promise.all(detailPromises),
      Promise.all(customerPromises),
    ]);
    let results = [];
    result.map((order, index) => {
      let resultObj = {};
      resultObj["order"] = order;
      resultObj["customer"] = customerResponses[index][0];
      resultObj["details"] = detailResponses[index];
      results.push(resultObj);
    });
    results.push({ currentPage: page });
    results.push({ totalPage: totalPage });

    res.send(message(true, "Lấy dữ liệu thành công!", results));
  } catch (error) {
    console.log(error);
    return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
  }
}

class OrderController {
  //[GET] /order/list
  async getList(req, res, next) {
    const orderId = req.query.orderId ? req.query.orderId : "";
    const key = req.query.key ? req.query.key : "";
    const page = req.query.page ? req.query.page : 1;
    const fromDate = req.query.fromDate;
    const toDate = req.query.toDate;
    let order;
    try {
      if (orderId != "") {
        order = await Order.getOrderById(orderId);

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

      let totalPage = 0;
      let total = [];

      if (
        fromDate != "" &&
        toDate != "" &&
        fromDate != undefined &&
        toDate != undefined
      ) {
        order = await Order.getListOrderRangeDate(key, page, fromDate, toDate);
        total = await Order.getTotalOrderRangeDate(key, fromDate, toDate);
        totalPage = calculateTotal(total[0]["total"]);
      } else {
        order = await Order.getListOrder(key, page);
        total = await Order.getTotalOrder(key);
        totalPage = calculateTotal(total[0]["total"]);
      }

      getDetailOrder(res, order, page, totalPage);
    } catch (error) {
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new OrderController();
