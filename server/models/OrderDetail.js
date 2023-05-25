import { connecting, query } from "../sql_connect/connected.js";

const OrderDetail = function (orderDetail) {
  this.orderDetailId = orderDetail.orderDetailId;
  this.orderId = orderDetail.orderTime;
  this.foodId = orderDetail.foodId;
  this.price = orderDetail.price;
  this.quantity = orderDetail.quantity;
};

OrderDetail.getByOrderId = async function (orderId) {
  try {
    const results = await query(
      "SELECT orderdetail.*, food.*" +
        " FROM orderdetail" +
        " JOIN food ON orderdetail.foodId = food.foodId" +
        " WHERE orderdetail.orderId = ?",
      [orderId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default OrderDetail;