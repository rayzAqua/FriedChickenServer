import Customer from "../models/Customer.js";
import Food from "../models/Food.js";
import FoodstockHistory from "../models/Foodstockhistory.js";
import Order from "../models/Order.js";
import OrderDetail from "../models/OrderDetail.js";
import PaymentMethod from "../models/PaymentMethod.js";
import Promote from "../models/Promote.js";
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
    // results.push({ currentPage: page });
    // results.push({ totalPage: totalPage });

    res.send(
      message(true, "Lấy dữ liệu thành công!", [
        { listOrder: results },
        { currentPage: page },
        { totalPage: totalPage },
      ])
    );
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

  //[POST] /order/create
  async create(req, res, next) {
    const { id, customerId, details, promoteId, paymentMethodId } = req.body;
    try {
      const customer = await Customer.getById(customerId);
      if (customer.length == 0) {
        return res.send(message(false, "Khách hàng không tồn tại!", ""));
      }

      //check promotion exist, ative and customer can use or not
      if (promoteId || null) {
        const promote = await Promote.getById(promoteId);
        if (promote.length == 0) {
          return res.send(message(false, "Khuyến mãi không hợp lệ!", ""));
        }

        if (promote[0]["available"] == 0) {
          return res.send(message(false, "Khuyến mãi hết hạn!", ""));
        }

        if (customer[0]["point"] < promote[0]["available"]) {
          return res.send(
            message(
              false,
              "Khách hàng không đủ điểm để áp dụng khuyến mãi!",
              ""
            )
          );
        }
      }

      //check method paymentmothod
      const paymentMethod = await PaymentMethod.getById(paymentMethodId);
      if (paymentMethod.length == 0) {
        return res.send(
          message(false, "Phương thức thanh toán không hợp lệ!", "")
        );
      }

      //check food
      const foodId = details[0]["foodId"];
      const food = await Food.getById(foodId);

      // food exist ?
      if (food.length == 0) {
        return res.send(message(false, "Món ăn không hợp lệ!", ""));
      }
      // food available ?
      if (food[0]["available"] == 0) {
        return res.send(message(false, "Món ăn không còn kinh doanh!", ""));
      }

      //check food in stock
      const foodstockHistory = await FoodstockHistory.getById(foodId);
      if (foodstockHistory.length == 0) {
        return res.send(message(false, "Món ăn không tồn tại trong kho!", ""));
      }

      if (foodstockHistory[0]["quantity"] == 0) {
        return res.send(message(false, "Món ăn hết trong kho!", ""));
      }

      console.log(foodstockHistory);

      //food on ready

      if (food[0]["unit"] == 0) {
        //check ingredient
        const ingredientFood = await Food.getIngredientOfFood(foodId);
        console.log("ingredientFood: ", ingredientFood);
        return res.send(message(false, "Món ăn không có sẵn!", ""));
      }
      console.log(food);
      return res.send(message(false, "Lấy dữ liệu thành công!", ""));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new OrderController();
