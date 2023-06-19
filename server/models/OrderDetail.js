import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class OrderDetail {
  constructor() {
    this.orderDetailId = null;
    this.orderId = null;
    this.foodId = null;
    this.price = null;
    this.quantity = null;
  }
  
  construct(orderDetail) {
    this.orderDetailId = orderDetail.orderDetailId;
    this.orderId = orderDetail.orderTime;
    this.foodId = orderDetail.foodId;
    this.price = orderDetail.price;
    this.quantity = orderDetail.quantity;
  }
  
  async getByOrderId(orderId) {
    try {
      // const results = await query(
      //   "SELECT orderdetail.*, food.*" +
      //     " FROM orderdetail" +
      //     " JOIN food ON orderdetail.foodId = food.foodId" +
      //     " WHERE orderdetail.orderId = ?",
      //   [orderId]
      // );
      const sp = "CALL sp_get_order_by_id(?);";
      const results = await query(sp, [orderId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async create(orderId, foodId, price, quantity) {
    try {
      // const results = await query(
      //   "SELECT orderdetail.*, food.*" +
      //     " FROM orderdetail" +
      //     " JOIN food ON orderdetail.foodId = food.foodId" +
      //     " WHERE orderdetail.orderId = ?",
      //   [orderId]
      // );
      const sp = "CALL sp_create_orderDetail(?,?,?,?);";
      const results = await query(sp, [orderId, foodId, price, quantity]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const orderDetail = Singleton.getModel('orderDetail', OrderDetail);

export default orderDetail;
