import Customer from "../models/Customer.js";
import Food from "../models/Food.js";
import FoodstockHistory from "../models/FoodstockHistory.js";
import IngredientStockHistory from "../models/IngredientStockHistory.js";
import Order from "../models/Order.js";
import OrderDetail from "../models/OrderDetail.js";
import PaymentMethod from "../models/PaymentMethod.js";
import Promote from "../models/Promote.js";
import User from "../models/User.js";
import { calculateTotal } from "../utils/calculateStart.js";
import message from "../utils/message.js";

async function getDetailOrder(res, result, isShow, page, totalPage) {
  const detailPromises = [];
  const promotionPromises = [];
  const customerPromises = [];
  const userPromises = [];
  const userCanclePromises = [];

  // Loop through each tour order and call Tour.getById() for its ID
  result.forEach((order) => {
    customerPromises.push(Customer.getById(order.customerId));
    promotionPromises.push(Promote.getAll(order.promoteId));
    detailPromises.push(OrderDetail.getByOrderId(order.orderId));
    userPromises.push(User.getById(order.createdUser));
    userCanclePromises.push(User.getById(order.createdUser));
  });

  try {
    const [
      detailResponses,
      customerResponses,
      promotionResponses,
      userResponses,
      userCancleResponses,
    ] = await Promise.all([
      Promise.all(detailPromises),
      Promise.all(customerPromises),
      Promise.all(promotionPromises),
      Promise.all(userPromises),
      Promise.all(userCanclePromises),
    ]);

    result.map((order, index) => {
      const customer = customerResponses[index][0];
      const promotion = promotionResponses[index][0];
      const details = detailResponses[index];
      const user = userResponses[index][0];
      const userCancle = userResponses[index][0];

      order["createdUser"] = user["name"];
      if (order["canceledUser"] != null)
        order["canceledUser"] = userCancle["name"];
      order["customerId"] = customer["customerId"];
      order["customerName"] = customer["name"];
      order["phone"] = customer["phone"];
      order["email"] = customer["email"];
      order["address"] = customer["address"];
      order["point"] = customer["point"];

      if (order["promoteId"] != null) {
        order["promotionName"] = promotion["name"];
        order["available"] = promotion["available"];
        order["discount"] = promotion["discount"];
        order["requirePoint"] = promotion["requirePoint"];
      }

      let list = [];
      let subTotal = 0;
      details.map((detail, index) => {
        let object = {};
        object["foodId"] = detail["foodId"];
        object["foodName"] = detail["name"];
        object["foodImage"] = detail["image"];
        object["price"] = detail["price"];
        object["quantity"] = detail["quantity"];
        subTotal += +detail["price"] * +detail["quantity"];
        list.push(object);
      });

      order["details"] = list;
      if (order["promoteId"] != null) {
        order["discountInmoney"] = (+promotion["discount"] * subTotal) / 100;
      } else {
        order["discountInmoney"] = 0;
      }

      order["subTotal"] = subTotal;
    });

    // results.push({ currentPage: page });
    // results.push({ totalPage: totalPage });

    if (res.headersSent) {
      // If the response has been sent, return or handle the error accordingly
      return;
    }

    // Set the necessary headers before sending the response
    res.setHeader("Content-Type", "application/json");

    res.send(
      message(true, "Lấy dữ liệu thành công!", result, isShow, +page, totalPage)
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
    const page = req.query.page || 1;
    const fromDate = req.query.fromDate;
    const toDate = req.query.toDate;
    let order;
    try {
      if (orderId != "") {
        order = await Order.getOrderById(orderId);

        if (order.length == 0) {
          return res.send(message(false, "Không tồn tại đơn hàng này!", ""));
        }

        // const customer = await Customer.getById(order[0].customerId);

        // const orderDetail = await OrderDetail.getByOrderId(order[0].orderId);

        // return res.send(
        //   message(true, "Lấy dữ liệu thành công!", [
        //     { order: order[0], customer: customer[0], details: orderDetail },
        //   ])
        // );
        getDetailOrder(res, order, false, 0, 0);
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

      getDetailOrder(res, order, true, page, totalPage);
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }

  //[POST] /order/create
  async create(req, res, next) {
    let { userId, customerId, details, promoteId, paymentMethodId } = req.body;
    try {
      const customer = await Customer.getById(customerId);
      if (customer.length == 0) {
        return res.send(message(false, "Khách hàng không tồn tại!", ""));
      }

      //check promotion exist, ative and customer can use or not
      let promote = null;
      if (promoteId == undefined) promoteId = null;
      if (promoteId || null) {
        promote = await Promote.getById(promoteId);
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

      //check list food
      for (var i = 0; i < details.length; i++) {
        //check food
        const foodId = details[i]["foodId"];
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
          return res.send(
            message(false, "Món ăn không tồn tại trong kho!", "")
          );
        }

        if (Number(foodstockHistory[0]["quantity"]) == 0) {
          return res.send(message(false, "Món ăn hết trong kho!", ""));
        }

        //check ingredient
        const ingredientFood = await Food.getIngredientOfFood(foodId);
        ingredientFood.map((ingredient, index) => {
          //check ingredient available?
          if (ingredient["available"] == 0) {
            return res.send(
              message(false, "Nguyên liệu hiện không khả dụng!", "")
            );
          }
        });

        // caculate number of food needs compare with stock
        let quantityFood = Number(details[i]["quantity"]);
        quantityFood = quantityFood - Number(foodstockHistory[0]["quantity"]);

        // still lack of food but can have ingredient to cook
        if (quantityFood != 0) {
          //check ingredient enough
          for (var i = 0; i < ingredientFood.length; i++) {
            const ingredient = ingredientFood[0];
            const ingredientId = ingredient["ingredientId"];
            const ingredientstockhistory =
              await IngredientStockHistory.getByIngredientId(ingredientId);

            if (
              Number(ingredient["quantity"]) * quantityFood >
              Number(ingredientstockhistory[0]["quantity"])
            ) {
              return res.send(message(false, "Nguyên liệu không đủ!", ""));
            }
          }
        }
      }

      //caculate total money
      let totalMoney = 0;
      details.map((food, index) => {
        totalMoney += Number(food["price"]) * Number(food["quantity"]);
      });

      //subtract price promote

      if (promote || null) {
        totalMoney -= (totalMoney * Number(promote[0]["discount"])) / 100;
      }

      //create order
      let order = await Order.create(
        totalMoney,
        userId,
        customerId,
        promoteId,
        paymentMethodId
      );

      console.log({ order });

      const orderId = order[0][0]["last_insert_id()"];

      //get order by id insert
      order = await Order.getOrderById(orderId);

      //add order detail
      for (var i = 0; i < details.length; i++) {
        //check food
        const foodId = details[i]["foodId"];
        const quantity = details[i]["quantity"];
        const price = details[i]["price"];

        await OrderDetail.create(orderId, foodId, price, quantity);
      }

      //caculate point = point current of customer + point extra from order - point subtract by promote

      let point = Number(customer[0]["point"]) + Math.round(totalMoney / 3000);

      if (promote || null) {
        point = point - Number(promote[0]["requirePoint"]);
      }

      //update point for customer
      await Customer.updatePoint(point, customer[0]["customerId"]);

      //get list promotion follows new point of customer
      const listPromotion = await Promote.getListCanUse(point);
      console.log("listPromotion: ", listPromotion);
      // sendMailPromotion("pvh9201@gmail.com");

      //send mail notification promotion can use with new point when order

      return res.send(message(true, "Đặt thành công!", order));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }

  //[PATCH] /order/:orderId/:status
  async changeStatusOrder(req, res, next) {
    const orderId = req.body.orderId ? req.body.orderId : "";
    const status = req.body.status ? req.body.status : "";
    const userId = req.body.userId ? req.body.userId : "";

    try {
      const order = await Order.getOrderById(orderId);

      if (status == "Cancelled" && order[0]["status"] != "Pending") {
        return res.send(message(false, "Không thể hủy đơn đặt!", ""));
      }

      const response = await Order.changeStatus(+orderId, status, userId);
      if (response["affectedRows"] <= 0) {
        return res.send(message(false, "Cập nhật trạng thái thất bại!", ""));
      }

      const promoteId = order[0]["promoteId"];
      if (promoteId != null) {
        const promotion = await Promote.getById(promoteId);
        const customerId = order[0]["customerId"];
        const customer = await Customer.getById(customerId);

        const point =
          Number(customer[0]["point"]) -
          Math.round(Number(order[0]["totalMoney"]) / 30000) +
          Number(promotion[0]["requirePoint"]);

        //update point for customer
        await Customer.updatePoint(point, customerId);
      }
      if (status == "Cancelled") {
        return res.send(message(true, "Hủy đơn đặt thành công!"));
      }
      return res.send(message(true, "Cập nhật trạng thái thành công!"));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Cập nhật trạng thái thất bại!", ""));
    }
  }

  async calculatePoint(req, res, next) {
    const money = Number(req.query.money);
    // const forCaculate = moneyForPoint.moneyForCaculatePoints;
    const forCaculate = 30000;

    try {
      // Tạo một đối tượng response để phản hồi.
      const response = {
        state: true,
        message: "Tính điểm tích luỹ thành công!",
      };

      if (money) {
        const points = Math.round(money / forCaculate);
        response.data = {
          point: points,
        };
      } else {
        response.state = false;
        response.message = "Không được bỏ trống số tiền!";
        response.data = [];
      }
      // OUTPUT
      res.status(200).json(response);
    } catch (err) {
      next(err);
    }
  }
}

export default new OrderController();
