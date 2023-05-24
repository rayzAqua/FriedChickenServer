import { connecting, query } from "../sql_connect/connected.js";

const Order = function (order) {
  this.orderId = order.orderId;
  this.orderTime = order.orderTime;
  this.createdUser = order.createdUser;
  this.customerId = order.customerId;
  this.promoteId = order.promoteId;
  this.canceledUser = order.canceledUser;
  this.paymentMethodId = order.paymentMethodId;
  this.canceledTime = order.canceledTime;
};

Order.getOrderById = async function (orderId) {
  try {
    const results = await query(
      "SELECT * FROM hethonggaran.order WHERE orderId =?;",
      [orderId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Order;
