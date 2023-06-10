import { query } from "../sql_connect/connected.js";

class Food {
  // Hàm khởi tạo
  constructor(food) {
    this.foodId = food.Id;
    this.name = food.name;
    this.available = food.available;
    this.unit = food.unit;
    this.createdTime = food.createdTime;
    this.updatedTime = food.updatedTime;
    this.createdUser = food.createdUser;
    this.updatedUser = food.updatedUser;
    this.categoryId = food.categoryId;
  }

  // Truy vấn tìm kiếm list food theo foodId, foodName, categoryName, categoryId hoặc page.
  static async getFoodList(foodId, k3y, categoryId, page_limit, off_set) {
    try {
      const sp = "CALL sp_get_food_list(?, ?, ?, ?, ?);";
      const foods = await query(sp, [
        foodId,
        k3y,
        categoryId,
        page_limit,
        off_set,
      ]);
      return foods;
    } catch (err) {
      console.log("Error executing query: ", err);
      throw err;
    }
  }

  static async getById(foodId) {
    try {
      // const results = await query("SELECT * FROM food WHERE foodId =?;", [
      //   foodId,
      // ]);

      const sp = "call sp_get_food_by_foodID(?);";
      const results = await query(sp, [foodId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  static async getIngredientOfFood(foodId) {
    try {
      // const results = await query(
      // "select hethonggaran.fooddetail.quantity, hethonggaran.ingredient.ingredientId, hethonggaran.ingredient.available" +
      //   " from hethonggaran.food" +
      //   " join hethonggaran.fooddetail on hethonggaran.fooddetail.foodId = hethonggaran.food.foodId" +
      //   " join hethonggaran.ingredient on hethonggaran.ingredient.ingredientId = hethonggaran.fooddetail.ingredientId" +
      //   " where hethonggaran.food.foodId =?",
      //   [foodId]
      // );

      const sp = "call getIngredientOfFood(?);";
      const results = await query(sp, [foodId]);
      console.log("results: ", results[0]);

      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

export default Food;
