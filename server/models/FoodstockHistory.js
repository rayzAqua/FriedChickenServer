import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class FoodstockHistory {
  constructor() {
    this.foodstockhistoryId = null;
    this.namequantity = null;
    this.createdTime = null;
    this.createdUser = null;
    this.foodId = null;
    this.wareHouseId = null;
  }

  construct(foodstockhistory) {
    this.foodstockhistoryId = foodstockhistory.foodstockhistoryId;
    this.namequantity = foodstockhistory.quantity;
    this.createdTime = foodstockhistory.createdTime;
    this.createdUser = foodstockhistory.createdUser;
    this.foodId = foodstockhistory.foodId;
    this.wareHouseId = foodstockhistory.wareHouseId;
  }
  
  async getById(foodId) {
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
  }
}

const foodstockHistory = Singleton.getModel('foodstockHistory', FoodstockHistory);

export default foodstockHistory;
