import Food from "../models/Food.js";
import { createError } from "../utils/createError.js"

export const getFoodList = async (req, res, next) => {

    const foodId = req.query.foodId || null;
    const foodName = req.query.foodName || null;
    const categoryName = req.query.categoryName || null;
    const categoryId = req.query.categoryId || null;
    // Giới hạn số lượng mẫu dữ liệu trả về cho một trang. Ở đây page_limit = 10 nghĩa là một trang chỉ có 10 mẫu dữ liệu.
    const page_limit = 10;
    // Số trang được truyền từ endpoint, mặc định là 1.
    const page = req.query.page || 1;

    // 1 trang sẽ có 10 mẫu dữ liệu.
    // 10 trang sẽ có 100 mãu dữ liệu.
    // trang sẽ được truyền vào từ query
    // ví dụ: có 30 mẫu dữ liệu. => total_page = 3.
    // Khi page = 1  thì tính toán offset = 0 để lấy từ 0-9
    // khi page = 2  thì tính toán offset = 10 để lấy từ 10-19
    // Tương tư với page = 3 thì tính toán offset = 20 để lấy từ 20-29
    // Vậy offset = (page - 1)*10
    // Vậy cứ mỗi lần độ dài của mảng filterFoodArray = 10 thì là một trang.
    // Để tính toán được tổng số trang cần phải biết được có tổng cộng bao nhiêu mẫu dữ liệu food có trong mảng.
    // ví dụ có 30 mẫu thì chia cho giới hạn mỗi trang là 10 là sẽ được totalPage = 3.

    console.log(foodId, foodName, categoryName, categoryId, page_limit, page);

    try {
        // Tính toán lại giá trị bắt đầu của offset dựa vào page.
        // page = 1, page_limit = 10. Điều này nghĩa là lấy từ vị trí 0-9. Như vậy offset có chỉ số bắt đầu là 0. 
        // Vậy offset = (1-1)*10 = 0;
        // page = 2, page_limit = 10. Lấy từ vị trí 10-19. Lúc này offset có chỉ số bắt đầu là từ 10.
        // Vậy offset = (2-1)*10 = 10;
        const offset = (page - 1) * 10;
        // Truy vấn lấy thức ăn theo Id
        const getFood = await Food.getFoodList(foodId, foodName, categoryName, categoryId, page_limit, offset);
        // Vì kết quả là một mảng chứa 2 giá trị là mảng đối tượng cần tìm và các thông tin liên quan đến truy vấn SQL
        // nên cần lọc lại mảng getFood và chỉ lấy mảng đối tượng food.        
        const filterFoodArray = Array.isArray(getFood[0]) ? getFood[0] : [getFood[0]];
        console.log(filterFoodArray);

        // Lấy tổng số mẫu dữ liệu có trong bảng food, từ tổng số mẫu dữ liệu suy ra được tổng số trang.
        const totalFoods = Array.isArray(getFood[1]) ? getFood[1] : [getFood[1]];
        console.log(totalFoods[0]);

        // Tính toán tổng số trang dựa trên tổng số mẫu dữ liệu có trong bảng food.
        const total_page = Math.ceil(totalFoods[0].total_foods / page_limit);
        console.log(total_page);

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
            res.status(200).json({
                state: true,
                message: "Lấy dữ liệu thành công!",
                data: {
                    list_food: foods,
                    current_page: Number(page),
                    total_page: total_page,
                },

            });
        }
        else {
            res.status(404).json({
                state: false,
                message: "Không tìm thấy dữ liệu!",
                data: filterFoodArray,
            });
        }
    } catch (err) {
        next(createError(err));
    }

}