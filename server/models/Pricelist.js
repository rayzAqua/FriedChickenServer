import { connecting, query } from "../sql_connect/connected.js";

const Pricelist = function (pricelist) {
  this.priceId = pricelist.priceId;
  this.type = pricelist.type;
  this.startDate = pricelist.startDate;
  this.enddate = pricelist.enddate;
  this.createdDate = pricelist.createdDate;
  this.updatedDate = pricelist.updatedDate;
  this.createdUser = pricelist.createdUser;
  this.updatedUser = pricelist.updatedUser;
};

Pricelist.getOrderById = async function (priceId) {
  try {
    const results = await query(
      "SELECT * FROM railway.pricelist where priceId = ?;",
      [priceId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Pricelist;
