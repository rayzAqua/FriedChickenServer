import { query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Ingredient {
    // Hàm khởi tạo
    constructor(ingredient) {
        this.ingredientId = ingredient.ingredientId;
        this.name = ingredient.name;
        this.unit = ingredient.unit;
        this.available = ingredient.available;
        this.image = ingredient.image;
        this.createdTime = ingredient.createdTime;
        this.updatedTime = ingredient.updatedTime;
        this.createdUser = ingredient.createdUser;
        this.updatedUser = ingredient.updatedUser;
    };

    // Lấy nguyên liệu theo Id
    async getIngredientById(ingredientId) {
        try {
            const q = "SELECT * FROM ingredient AS i WHERE i.ingredientId = ?;";
            const ingredients = await query(q, [ingredientId]);
            return ingredients;
        } catch (err) {
            console.log("Error executing query: ", err);
            throw err;
        }
    };

    // SP lấy danh sách nguyên liệu dựa trên các tham số truyền vào
    async getIngredientList(ingredientId, k3y, wareHouseId, page_limit, off_set) {
        try {
            const sp = "CALL sp_get_ingredient_list(?, ?, ?, ?, ?);"
            const ingredientList = await query(sp, [ingredientId, k3y, wareHouseId, page_limit, off_set]);
            return ingredientList;
        } catch (err) {
            console.log("Error executing query: ", err);
            throw err;
        }
    }
}

const ingredient = Singleton.getModel("ingredient", Ingredient);

export default ingredient;
