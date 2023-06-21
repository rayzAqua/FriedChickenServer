import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Pricelist {
  constructor() {
    this.priceId = null;
    this.type = null;
    this.startDate = null;
    this.enddate = null;
    this.createdDate = null;
    this.updatedDate = null;
    this.createdUser = null;
    this.updatedUser = null;
  }

  setPricelist(pricelist) {
    this.priceId = pricelist.priceId;
    this.type = pricelist.type;
    this.startDate = pricelist.startDate;
    this.enddate = pricelist.enddate;
    this.createdDate = pricelist.createdDate;
    this.updatedDate = pricelist.updatedDate;
    this.createdUser = pricelist.createdUser;
    this.updatedUser = pricelist.updatedUser;
  }

  async getById(priceId) {
    try {
      // const results = await query(
      //   "SELECT * FROM railway.pricelist where priceId = ?;",
      //   [priceId]
      // );
      const sp = "call sp_get_priceList_by_id(?);";
      const results = await query(sp, [priceId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getList(page) {
    try {
      // const results = await query(
      //   "SELECT railway.pricelist.*,  railway.user.name as 'userNameCreated'" +
      //     " FROM railway.pricelist" +
      //     " join railway.user on pricelist.createdUser = user.userId" +
      //     " order by pricelist.createdDate DESC" +
      //     " limit 10 offset ?;",
      //   [page]
      // );
      const sp = "call sp_get_list_priceList(?);";
      const results = await query(sp, [page]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getListDouble(type, startDate, endDate) {
    try {
      const sp = "call sp_get_list_price_duble(?,?,?);";
      const results = await query(sp, [type, startDate, endDate]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getListByFoodId(foodId, page) {
    try {
      // const results = await query(
      //   "SELECT railway.pricelist.*,  railway.user.name as 'userNameCreated'" +
      //     " FROM railway.pricelist" +
      //     " join railway.user on pricelist.createdUser = user.userId" +
      //     " order by pricelist.createdDate DESC" +
      //     " limit 10 offset ?;",
      //   [page]
      // );
      const sp = "call sp_get_list_priceListById(?,?);";
      const results = await query(sp, [foodId, page]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async create(type, startDate, endDate, userId) {
    try {
      // const results = await query(
      //   "insert into pricelist(type, startDate, enddate, createdUser)" +
      //     " values (?, ? ,?,?)",
      //   [type, startDate, endDate, userId]
      // );
      const sp = "call sp_create_priceList(?,?,?,?);";
      const results = await query(sp, [type, startDate, endDate, userId]);
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const priceList = Singleton.getModel("priceList", Pricelist);

export default priceList;
