import { query } from "../sql_connect/connected.js";

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

    static async getIngredientById(ingredientId) {
        try {
            const q = "SELECT * FROM ingredient AS i WHERE i.ingredientId = ?;";
            const ingredients = await query(q, [ingredientId]);
            return ingredients;
        } catch (err) {
            console.log("Error executing query: ", err);
            throw err;
        }
    };
}