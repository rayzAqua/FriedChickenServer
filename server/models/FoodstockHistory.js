import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

const FoodstockHistory = function (foodstockhistory) {
  this.foodstockhistoryId = foodstockhistory.foodstockhistoryId;
  this.namequantity = foodstockhistory.quantity;
  this.createdTime = foodstockhistory.createdTime;
  this.createdUser = foodstockhistory.createdUser;
  this.foodId = foodstockhistory.foodId;
  this.wareHouseId = foodstockhistory.wareHouseId;
};

FoodstockHistory.getById = async function (foodId) {
  try {
    // const results = await query(
    //   "SELECT * FROM hethonggaran.foodstockhistory WHERE foodId =?;",
    //   [foodId]
    // );

    const sp = "call sp_get_foodStockHistory_by_foodId(?)";
    const results = await query(sp, [foodId]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

const foodstockHistory = Singleton.getModel('foodstockHistory', FoodstockHistory);

export default foodstockHistory;
