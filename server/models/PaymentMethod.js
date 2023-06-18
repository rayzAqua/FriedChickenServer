import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

const PaymentMethod = function (paymentMethod) {
  this.paymentMethodId = paymentMethod.paymentMethodId;
  this.name = paymentMethod.name;
  this.detail = paymentMethod.detail;
};

PaymentMethod.getById = async function (paymentMethodId) {
  try {
    // const results = await query(
    //   "SELECT * FROM hethonggaran.paymentmethod WHERE paymentMethodId =?;",
    //   [paymentMethodId]
    // );

    const sp = "CALL sp_get_paymentMethod_by_id(?);";
    const results = await query(sp, [paymentMethodId]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

PaymentMethod.getAll = async function () {
  try {
    // const results = await query("SELECT * FROM hethonggaran.paymentmethod ");

    const sp = "CALL sp_get_all_paymentMethod();";
    const results = await query(sp);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

const paymentMethod = Singleton.getModel('paymentMethod', PaymentMethod);

export default paymentMethod;
