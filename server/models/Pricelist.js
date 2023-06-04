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

Pricelist.getById = async function (priceId) {
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

Pricelist.getList = async function (page) {
  try {
    const results = await query(
      "SELECT railway.pricelist.*,  railway.user.name as 'userNameCreated'" +
        " FROM railway.pricelist" +
        " join railway.user on pricelist.createdUser = user.userId" +
        " order by pricelist.createdDate DESC" +
        " limit 10 offset ?;",
      [page]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Pricelist.create = async function (type, startDate, endDate, userId) {
  try {
    const results = await query(
      "insert into pricelist(type, startDate, enddate, createdUser)" +
        " values (?, ? ,?,?)",
      [type, startDate, endDate, userId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Pricelist;
