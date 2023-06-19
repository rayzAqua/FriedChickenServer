import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Promote {
  constructor() {
    this.promoteId = null;
    this.name = null;
    this.dateCreated = null;
    this.available = null;
    this.discount = null;
    this.requirePoint = null;
    this.createdUser = null;
  }

  setPromote(promote) {
    this.promoteId = promote.promoteId;
    this.name = promote.name;
    this.dateCreated = promote.dateCreated;
    this.available = promote.available;
    this.discount = promote.discount;
    this.requirePoint = promote.requirePoint;
    this.createdUser = promote.createdUser;
  }

  async create(name, discount, requirePoint, createdUser) {
    try {
      // const results = await query("SELECT * FROM hethonggaran.promotion ");

      const sp = "CALL sp_add_promotion(?,?,?,?);";
      const results = await query(sp, [
        name,
        discount,
        requirePoint,
        createdUser,
      ]);
      return results[0][0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  };

  async getById(promoteId) {
    try {
      // const results = await query(
      //   "SELECT * FROM hethonggaran.promotion WHERE promoteId =?;",
      //   [promoteId]
      // );
      const sp = "CALL sp_get_promote_by_id(?);";
      const results = await query(sp, [promoteId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getAll() {
    try {
      // const results = await query("SELECT * FROM hethonggaran.promotion ");
      const sp = "CALL sp_get_all_promote();";
      const results = await query(sp);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getListCanUse(point) {
    try {
      // const results = await query("SELECT * FROM hethonggaran.promotion ");
      const sp = "CALL sp_get_list_promotion_can_use(?);";
      const results = await query(sp, [point]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const promote = Singleton.getModel("promote", Promote);

export default promote;
