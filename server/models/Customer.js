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
    const results = await query(
      "SELECT * FROM hethonggaran.customer WHERE customerId =?;",
      [customerId]
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
    const sp = "CALL sp_create_customer(?, ?, ?, ?)";
    // Gọi đến sp_create_customer và truyền 4 tham số name, phone, email, address vào để tiến hành tạo mới khách hàng.
    const newCustomer = await query(sp, [name, phone, email, address]);
    console.log(newCustomer);
    return newCustomer;
  } catch (err) {
    console.log("Error executing query: ", err);
    throw err;
  }
}

export default Customer;
