import { connecting, query } from "../sql_connect/connected.js";
import calculateStart from "../utils/calculateStart.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Order {
  constructor() {
    this.orderId = null;
    this.orderTime = null;
    this.createdUser = null;
    this.customerId = null;
    this.promoteId = null;
    this.canceledUser = null;
    this.paymentMethodId = null;
    this.canceledTime = null;
  }
  
  setOrder(order) {
    this.orderId = order.orderId;
    this.orderTime = order.orderTime;
    this.createdUser = order.createdUser;
    this.customerId = order.customerId;
    this.promoteId = order.promoteId;
    this.canceledUser = order.canceledUser;
    this.paymentMethodId = order.paymentMethodId;
    this.canceledTime = order.canceledTime;
  }

  async getOrderById(orderId) {
    try {
      // const results = await query(
      //   "SELECT * FROM hethonggaran.order WHERE orderId =?;",
      //   [orderId]
      // );
      const sp = "call sp_get_order(?);";
      const results = await query(sp, [orderId]);

      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async changeStatus(orderId,
    status = "Pending",
    userCancle = 1) {
    try {
      const sp = "call sp_update_status_order(?,?,?);";
      const results = await query(sp, [orderId, status, userCancle]);

      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async getListOrder(key, page) {
    try {
      // const results = await query(
      //   "SELECT hethonggaran.order.*" +
      //     " FROM hethonggaran.order" +
      //     " join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId " +
      //     " where hethonggaran.order.orderId  = ? or hethonggaran.order.customerId = ?" +
      //     " or hethonggaran.customer.name like ? or hethonggaran.customer.phone like ?" +
      //     " or hethonggaran.customer.email like ?" +
      //     " order by orderTime DESC" +
      //     " limit 10 OFFSET ?",
      //   [
      //     key,
      //     key,
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     calculateStart(page),
      //   ]
      // );
      const sp = "CALL getListOrder(?, ?);";
      const results = await query(sp, [key, calculateStart(page)]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async getListOrderRangeDate(key, page, fromDate, toDate) {
    try {
      // const results = await query(
      //   "SELECT hethonggaran.order.* " +
      //     " FROM hethonggaran.order " +
      //     " join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId  " +
      //     " where (hethonggaran.order.orderId  = ? " +
      //     " or hethonggaran.order.customerId = ? " +
      //     " or hethonggaran.customer.name like ? " +
      //     " or hethonggaran.customer.phone like ? " +
      //     " or hethonggaran.customer.email like ? )" +
      //     " and hethonggaran.order.orderTime >= ? and hethonggaran.order.orderTime <= ?" +
      //     " order by hethonggaran.order.orderTime DESC limit 10 OFFSET ?",
      //   [
      //     key,
      //     key,
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     fromDate,
      //     toDate,
      //     calculateStart(page),
      //   ]
      // );
      const sp = "CALL getListOrderRangeDate(?, ?, ?, ?);";
      const results = await query(sp, [
        key,
        calculateStart(page),
        fromDate,
        toDate,
      ]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async getTotalOrder(key) {
    try {
      // const results = await query(
      //   "SELECT COUNT(*) AS total from (" +
      //     "  SELECT hethonggaran.order.*" +
      //     "  FROM hethonggaran.order" +
      //     "  JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId" +
      //     "  WHERE hethonggaran.order.orderId = ?" +
      //     "     OR hethonggaran.order.customerId = ?" +
      //     "     OR hethonggaran.customer.name LIKE ?" +
      //     "     OR hethonggaran.customer.phone LIKE ?" +
      //     "     OR hethonggaran.customer.email LIKE ?" +
      //     "  ORDER BY orderTime DESC ) as listOrder;",
      //   [key, key, "%" + key + "%", "%" + key + "%", "%" + key + "%"]
      // );
      const sp = "CALL getTotalOrder(?);";
      const results = await query(sp, [key]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async getTotalOrderRangeDate(key, fromDate, toDate) {
    try {
      // const results = await query(
      //   "SELECT COUNT(*) AS total from (" +
      //     " SELECT hethonggaran.order.*" +
      //     " FROM hethonggaran.order" +
      //     " JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId" +
      //     " WHERE (hethonggaran.order.orderId = ?" +
      //     "   OR hethonggaran.order.customerId = ?" +
      //     "   OR hethonggaran.customer.name LIKE ?" +
      //     "   OR hethonggaran.customer.phone LIKE ?" +
      //     "   OR hethonggaran.customer.email LIKE ? )" +
      //     " and hethonggaran.order.orderTime >= ? and hethonggaran.order.orderTime <= ?" +
      //     " ORDER BY orderTime DESC ) as listOrder;",
      //   [
      //     key,
      //     key,
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     "%" + key + "%",
      //     fromDate,
      //     toDate,
      //   ]
      // );
      const sp = "CALL getTotalOrderRangeDate(?, ?, ?);";
      const results = await query(sp, [key, fromDate, toDate]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async create(totalMoney,
    createdUser,
    customerId,
    promoteId,
    paymentMethodId) {
    try {
      // const results = await query(
      //   "INSERT INTO hethonggaran.order(totalMoney, createdUser, customerId,promoteId, paymentMethodId)" +
      //     " VALUES (?,?,?,?,?);",
      //   [totalMoney, createdUser, customerId, promoteId, paymentMethodId]
      // );
      const sp = "call sp_create_order(?, ?, ?, ?, ?);";
      const results = await query(sp, [
        totalMoney,
        createdUser,
        customerId,
        promoteId,
        paymentMethodId,
      ]);
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  // Tính điểm tích luỹ
  
  async calculatePoint(customerId, orderId) {
    try {
      const sp = "CALL sp_caculate_point(?, ?);";
      const point = await query(sp, [customerId, orderId]);
      return point;
    } catch (err) {
      console.error("Error executing query:", err);
      throw err;
    }
  }
}

const order = Singleton.getModel('order', Order);

export default order;
