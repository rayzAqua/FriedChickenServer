import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class IngredientStockHistory {
  constructor() {
    this.ingredientStockHistoryId = null;
    this.quantity = null;
    this.createdTime = null;
    this.createdUser = null;
    this.wareHouseId = null;
    this.ingredientId = null;
  }

  setIngredientStockHistory(ingredientstockhistory) {
    this.ingredientStockHistoryId =
      ingredientstockhistory.ingredientStockHistoryId;
    this.quantity = ingredientstockhistory.quantity;
    this.createdTime = ingredientstockhistory.createdTime;
    this.createdUser = ingredientstockhistory.createdUser;
    this.wareHouseId = ingredientstockhistory.wareHouseId;
    this.ingredientId = ingredientstockhistory.ingredientId;
  }

  async getByIngredientId(ingredientId) {
    try {
      // const results = await query(
      //   "SELECT * FROM ingredientstockhistory WHERE ingredientId =?;",
      //   [ingredientId]
      // );
      const sp = "call sp_get_ingredientStockHistory_by_ingredientId(?);";
      const results = await query(sp, [ingredientId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async create(quantity, price, createdUser, wareHouseId, ingredientId) {
    try {
      // const results = await query(
      //   "SELECT * FROM ingredientstockhistory WHERE ingredientId =?;",
      //   [ingredientId]
      // );
      const sp = "call sp_add_history_ingredient(?,?,?,?,?);";
      const results = await query(sp, [
        quantity,
        price,
        createdUser,
        wareHouseId,
        ingredientId,
      ]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getQuantityAvailable(wareHouseId, ingredientId) {
    try {
      const sp = "call sp_get_quantity_avalable(?,?);";
      const results = await query(sp, [wareHouseId, ingredientId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const ingredientStockHistory = Singleton.getModel(
  "ingredientStockHistory",
  IngredientStockHistory
);

export default ingredientStockHistory;
