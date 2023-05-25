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
    const results = await query(
      "SELECT * FROM hethonggaran.promotion WHERE promoteId =?;",
      [promoteId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Promote;
