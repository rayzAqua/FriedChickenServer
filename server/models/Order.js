import { connecting, query } from "../sql_connect/connected.js";
import calculateStart from "../utils/calculateStart.js";

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

Order.getListOrder = async function (key, page) {
  try {
    const results = await query(
      "SELECT hethonggaran.order.*" +
        " FROM hethonggaran.order" +
        " join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId " +
        " where hethonggaran.order.orderId  = ? or hethonggaran.order.customerId = ?" +
        " or hethonggaran.customer.name like ? or hethonggaran.customer.phone like ?" +
        " or hethonggaran.customer.email like ?" +
        " order by orderTime DESC" +
        " limit 10 OFFSET ?",
      [
        key,
        key,
        "%" + key + "%",
        "%" + key + "%",
        "%" + key + "%",
        calculateStart(page),
      ]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Order.getListOrderRangeDate = async function (key, page, fromDate, toDate) {
  try {
    const results = await query(
      "SELECT hethonggaran.order.* " +
        " FROM hethonggaran.order " +
        " join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId  " +
        " where (hethonggaran.order.orderId  = ? " +
        " or hethonggaran.order.customerId = ? " +
        " or hethonggaran.customer.name like ? " +
        " or hethonggaran.customer.phone like ? " +
        " or hethonggaran.customer.email like ? )" +
        " and hethonggaran.order.orderTime >= ? and hethonggaran.order.orderTime <= ?" +
        " order by hethonggaran.order.orderTime DESC limit 10 OFFSET ?",
      [
        key,
        key,
        "%" + key + "%",
        "%" + key + "%",
        "%" + key + "%",
        fromDate,
        toDate,
        calculateStart(page),
      ]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Order.getTotalOrder = async function (key) {
  try {
    const results = await query(
      "SELECT COUNT(*) AS total from (" +
        "  SELECT hethonggaran.order.*" +
        "  FROM hethonggaran.order" +
        "  JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId" +
        "  WHERE hethonggaran.order.orderId = ?" +
        "     OR hethonggaran.order.customerId = ?" +
        "     OR hethonggaran.customer.name LIKE ?" +
        "     OR hethonggaran.customer.phone LIKE ?" +
        "     OR hethonggaran.customer.email LIKE ?" +
        "  ORDER BY orderTime DESC ) as listOrder;",
      [key, key, "%" + key + "%", "%" + key + "%", "%" + key + "%"]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Order.getTotalOrderRangeDate = async function (key, fromDate, toDate) {
  try {
    const results = await query(
      "SELECT COUNT(*) AS total from (" +
        " SELECT hethonggaran.order.*" +
        " FROM hethonggaran.order" +
        " JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId" +
        " WHERE (hethonggaran.order.orderId = ?" +
        "   OR hethonggaran.order.customerId = ?" +
        "   OR hethonggaran.customer.name LIKE ?" +
        "   OR hethonggaran.customer.phone LIKE ?" +
        "   OR hethonggaran.customer.email LIKE ? )" +
        " and hethonggaran.order.orderTime >= ? and hethonggaran.order.orderTime <= ?" +
        " ORDER BY orderTime DESC ) as listOrder;",
      [
        key,
        key,
        "%" + key + "%",
        "%" + key + "%",
        "%" + key + "%",
        fromDate,
        toDate,
      ]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Order;
