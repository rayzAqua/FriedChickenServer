import { connecting, query } from "../sql_connect/connected.js";

const Customer = function (customer) {
  this.customerId = customer.customerId;
  this.name = customer.name;
  this.phone = customer.phone;
  this.email = customer.email;
  this.address = customer.address;
  this.createdTime = customer.createdTime;
  this.point = customer.point;
};

Customer.getById = async function (customerId) {
  try {
    // const results = await query(
    //   "SELECT * FROM hethonggaran.customer WHERE customerId =?;",
    //   [customerId]
    // );

    const sp = "CALL sp_get_customer_by_id(?)";
    const results = await query(sp, [customerId]);
    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Customer.updatePoint = async function (point, customerId) {
  try {
    const results = await query(
      "update customer" + " set point = ?" + " where customerId  =?;",
      [point, customerId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

// Thực thi sp tạo mới khách hàng.
Customer.createCustomer = async function (name, phone, email, address) {
  try {
    // Câu truy vấn gọi sp_create_customer với 4 tham số truyền vào.
    const sp = "CALL sp_create_customer(?, ?, ?, ?);";
    // Gọi đến sp_create_customer và truyền 4 tham số name, phone, email, address vào để tiến hành tạo mới khách hàng.
    const newCustomer = await query(sp, [name, phone, email, address]);
    return newCustomer;
  } catch (err) {
    console.log("Error executing query: ", err);
    throw err;
  }
};

// Lấy danh sách khách hàng
Customer.getCustomerList = async function (
  customerId,
  name,
  phone,
  email,
  page_limit,
  off_set
) {
  try {
    // Câu truy vấn gọi sp_get_customer_list với 6 tham số truyền vào.
    const sp = "CALL sp_get_customer_list(?, ?, ?, ?, ?, ?);";
    // Thực thi sp_get_cusotmer_list với 6 tham số customerId, name, phone, email, page_limit, off_set để tiến hành lấy về danh sách
    // các khách hàng.
    const customers = await query(sp, [
      customerId,
      name,
      phone,
      email,
      page_limit,
      off_set,
    ]);
    console.log(customers);
    return customers;
  } catch (err) {
    console.log("Error executing query: ", err);
    throw err;
  }
};

export default Customer;
