import { query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Category {
  // Hàm khởi tạo
  constructor(category) {
    this.categoryId = category.categoryId;
    this.name = category.name;
    this.createdTime = category.createdTime;
    this.updatedTime = category.updatedTime;
    this.createdUser = category.createdUser;
    this.updatedUser = category.updatedUser;
  }

  static async getById(categoryId) {
    try {
      const sp = "call sp_get_category_by_id(?);";
      const results = await query(sp, [categoryId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  static async getList() {
    try {
      const results = await query("SELECT * FROM railway.category;");
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const category = Singleton.getModel('category', Category);

export default category;
