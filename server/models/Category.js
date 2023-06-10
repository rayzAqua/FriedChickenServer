import { query } from "../sql_connect/connected.js";

class Category {
    // Hàm khởi tạo
    constructor(Category) {
        this.categoryId = Category.categoryId;
        this.name = Category.name;
        this.createdTime = Category.createdTime;
        this.updatedTime = Category.updatedTime;
        this.createdUser = Category.createdUser;
        this.updatedUser = Category.updatedUser;
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
}

export default Category;
