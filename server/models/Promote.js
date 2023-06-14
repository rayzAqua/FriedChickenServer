import { connecting, query } from "../sql_connect/connected.js";

const Promote = function (promote) {
  this.promoteId = promote.promoteId;
  this.name = promote.name;
  this.dateCreated = promote.dateCreated;
  this.available = promote.available;
  this.discount = promote.discount;
  this.requirePoint = promote.requirePoint;
  this.createdUser = promote.createdUser;
};

Promote.getById = async function (promoteId) {
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
};

Promote.getAll = async function () {
  try {
    // const results = await query("SELECT * FROM hethonggaran.promotion ");

    const sp = "CALL sp_get_all_promote();";
    const results = await query(sp);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Promote.getListCanUse = async function (point) {
  try {
    // const results = await query("SELECT * FROM hethonggaran.promotion ");

    const sp = "CALL sp_get_list_promotion_can_use(?);";
    const results = await query(sp, [point]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Promote;
