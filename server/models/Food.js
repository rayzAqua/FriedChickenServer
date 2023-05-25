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
    static async getFoodList(foodId, foodName, categoryName, categoryId, page_limit, page) {
        try {
            const sp = "CALL sp_get_food_list(?, ?, ?, ?, ?, ?)"
            const food = await query(sp, [foodId, foodName, categoryName, categoryId, page_limit, page]);
            return food;
        } catch (err) {
            throw err;
        }
    }
}

export default Food;
