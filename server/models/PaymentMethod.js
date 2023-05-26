import { connecting, query } from "../sql_connect/connected.js";

const PaymentMethod = function (paymentMethod) {
  this.paymentMethodId = paymentMethod.paymentMethodId;
  this.name = paymentMethod.name;
  this.detail = paymentMethod.detail;
};

PaymentMethod.getById = async function (paymentMethodId) {
  try {
    const results = await query(
      "SELECT * FROM hethonggaran.paymentmethod WHERE paymentMethodId =?;",
      [paymentMethodId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

PaymentMethod.getAll = async function () {
  try {
    const results = await query("SELECT * FROM hethonggaran.paymentmethod ");
    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default PaymentMethod;
