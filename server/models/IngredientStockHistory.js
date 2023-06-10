import { connecting, query } from "../sql_connect/connected.js";

const IngredientStockHistory = function (ingredientstockhistory) {
  this.ingredientStockHistoryId =
    ingredientstockhistory.ingredientStockHistoryId;
  this.quantity = ingredientstockhistory.quantity;
  this.createdTime = ingredientstockhistory.createdTime;
  this.createdUser = ingredientstockhistory.createdUser;
  this.wareHouseId = ingredientstockhistory.wareHouseId;
  this.ingredientId = ingredientstockhistory.ingredientId;
};

IngredientStockHistory.getByIngredientId = async function (ingredientId) {
  try {
    // const results = await query(
    //   "SELECT * FROM ingredientstockhistory WHERE ingredientId =?;",
    //   [ingredientId]
    // );

    const sp = "call sp_get_ingredientStockHistory_by_ingredientId(?);";
    const results = await query(sp, [ingredientId]);
    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default IngredientStockHistory;
