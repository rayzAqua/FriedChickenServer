import { connecting, query } from "../sql_connect/connected.js";
import { createError } from "../utils/createError.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Customer {
  constructor() {
    this.customerId = null;
    this.name = null;
    this.phone = null;
    this.email = null;
    this.address = null;
    this.createdTime = null;
    this.point = null;
  }

  contructor(customer) {
    this.customerId = customer.customerId;
    this.name = customer.name;
    this.phone = customer.phone;
    this.email = customer.email;
    this.address = customer.address;
    this.createdTime = customer.createdTime;
    this.point = customer.point;
  }

  async getById(customerId) {
    try {
      // const results = await query(
      //   "SELECT * FROM hethonggaran.customer WHERE customerId =?;",
      //   [customerId]
      // );
      const sp = "CALL sp_get_customer_by_id(?);";
      const results = await query(sp, [customerId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async updatePoint(point, customerId) {
    try {
      // const results = await query(
      //   "update customer" + " set point = ?" + " where customerId  =?;",
      //   [point, customerId]
      // );
      const sp = "call sp_updatePoint_customer(?, ?);";
      const results = await query(sp, [point, customerId]);
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  // Truy vấn khách hàng theo email hoặc sđt
  async getCustomerByEmailPhone(phone, email) {
    try {
      const sp = "CALL sp_get_customer_by_emailphone(?, ?);";
      const existedCustomer = await query(sp, [phone, email]);
      return existedCustomer;
    } catch (err) {
      console.error("Error executing query: ", err);
    }
  }

  // Thực thi sp tạo mới khách hàng.
  async createCustomer(name, phone, email, address, createdUser) {
    try {
      const sp = "CALL sp_create_customer(?, ?, ?, ?, ?);";
      const newCustomer = await query(sp, [name, phone, email, address, createdUser]);
      return newCustomer;
    } catch (err) {
      console.error("Error executing query: ", err);
    }
  }

  // Cập nhật thông tin khách hàng
  async updateCustomer(customerId, name, phone, email, address, updatedUser, updatedTime) {
    try {
      const sp = "CALL sp_update_customer(?, ?, ?, ?, ?, ?, ?);";
      const updatedCustomer = await query(sp, [customerId, name, phone, email, address, updatedUser, updatedTime]);
      return updatedCustomer;
    } catch (err) {
      console.error("Error executing query: ", err);
    }
  }

  // Lấy danh sách khách hàng
  async getCustomerList(customerId,
    k3y,
    page_limit,
    off_set) {
    try {
      // Câu truy vấn gọi sp_get_customer_list với 6 tham số truyền vào.
      const sp = "CALL sp_get_customer_list(?, ?, ?, ?);";
      // Thực thi sp_get_cusotmer_list với 6 tham số customerId, name, phone, email, page_limit, off_set để tiến hành lấy về danh sách
      // các khách hàng.
      const customers = await query(sp, [customerId, k3y, page_limit, off_set]);
      return customers;
    } catch (err) {
      console.log("Error executing query: ", err);
      throw err;
    }
  }
}








Customer.getCustomerListForNewPromotion = async function (point) {
  try {
    // Câu truy vấn gọi sp_get_customer_list với 6 tham số truyền vào.
    const sp = "CALL sp_get_list_customer_for_new_promotion(?);";
    // Thực thi sp_get_cusotmer_list với 6 tham số customerId, name, phone, email, page_limit, off_set để tiến hành lấy về danh sách
    // các khách hàng.
    const customers = await query(sp, [point]);

    return customers[0];
  } catch (err) {
    console.log("Error executing query: ", err);
    throw err;
  }
};

const customer = Singleton.getModel("customer", Customer);

export default customer;
