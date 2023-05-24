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

export default Customer;
