import { query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Food {
  // Hàm khởi tạo
  constructor() {
    this.foodId = null;
    this.name = null;
    this.available = null;
    this.unit = null;
    this.createdTime = null;
    this.updatedTime = null;
    this.createdUser = null;
    this.updatedUser = null;
    this.categoryId = null;
  }

  construct(food) {
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

  // Create
   async newFood(name, unit, categoryId, image, price, priceListId, createdUser) {
    try {
      const sp = "CALL sp_create_food(?, ?, ?, ?, ?, ?, ?);"
      const newFood = await query(sp, [name, unit, categoryId, image, price, priceListId, createdUser]);
      return newFood[0];
    } catch (err) {
      console.error("Error executing query: ", err);
    }
  }

  // Update
  async findByIdAndUpdate(
    foodId,
    name,
    unit,
    image,
    available,
    categoryId,
    updatedTime,
    updatedUser
  ) {
    try {
      const sp = "CALL sp_update_food(?, ?, ?, ?, ?, ?, ?, ?);";
      const updatedFood = await query(sp, [
        foodId,
        name,
        unit,
        image,
        available,
        categoryId,
        updatedTime,
        updatedUser,
      ]);
      return updatedFood;
    } catch (err) {
      console.error("Error executing query: ", err);
    }
  }

  // Truy vấn tìm kiếm list food theo foodId, foodName, categoryName, categoryId hoặc page.
  async getFoodList(foodId, k3y, categoryId, page_limit, off_set) {
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
      console.error("Error executing query: ", err);
    }
  }

  async getById(foodId) {
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

  async getIngredientOfFood(foodId) {
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

const food = Singleton.getModel('food', Food);

export default food;
