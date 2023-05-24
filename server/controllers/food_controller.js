import Food from "../models/Food.js";
import { createError } from "../utils/createError.js"

export const getFoodList = async (req, res, next) => {

    const foodId = req.body.foodId || null;
    const foodName = req.body.foodName || null;
    const categoryName = req.body.categoryName || null;
    const categoryId = req.body.categoryId || null;
    const page = req.body.page || 10;

    console.log(foodId, foodName, categoryName, categoryId, page);

    try {
        // Truy vấn lấy thức ăn theo Id
        const getFood = await Food.getFoodList(foodId, foodName, categoryName, categoryId, page);
        // Vì kết quả là một mảng chứa 2 giá trị là mảng đối tượng cần tìm và các thông tin liên quan đến truy vấn SQL
        // nên cần lọc lại mảng getFood và chỉ lấy mảng đối tượng food.        
        const filterFoodArray = Array.isArray(getFood[0]) ? getFood[0] : [getFood[0]];
        console.log(filterFoodArray);

        // Kiểm tra xem mảng đối tượng cần tìm có phần tử nào không. Nếu có thì trả về Output. Nếu không thì báo lỗi.
        if (filterFoodArray.length > 0) {
            // Định dạng lại dữ liệu của các đối tượng food có trong mảng filterFoodArray để làm output.
            const foods = filterFoodArray.map((food) => {
                const { categoryId, categoryName, ...otherDetails } = food;
                return {
                    ...otherDetails,
                    category: {
                        categoryId: categoryId,
                        categoryName: categoryName,
                    }
                }
            });
            // Output
            res.status(200).json(foods);
        }
        else {
            next(createError(404, "Không tìm thấy dữ liệu!"));
        }
    } catch (err) {
        next(err);
    }

}