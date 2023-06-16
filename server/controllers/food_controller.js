import Food from "../models/Food.js";
import User from "../models/User.js";
import Category from "../models/Category.js";
import { createError } from "../utils/createError.js"
import { isAlphaNumbericString, isAlphabeticString } from "../utils/checkInput.js";

// UPDATE
export const updateFood = async (req, res, next) => {
    const foodId = req.body.foodId;
    const name = req.body.name || null;
    const unit = req.body.unit || null;
    const image = req.body.image || null;
    const available = String(req.body.available) || null;
    const categoryId = req.body.categoryId || null;
    const updatedUser = req.body.userId;

    try {
        // Kiểm tra tồn tại food
        const existedFood = await Food.getById(foodId);
        if (foodId) {
            if (typeof foodId !== 'number') {
                res.status(400).json({
                    state: false,
                    message: "Phải nhập số cho ID của Food!",
                    data: []
                });
                return;
            }
            if (existedFood.length <= 0) {
                res.status(404).json({
                    state: false,
                    message: "Food không tồn tại!",
                    data: []
                });
                return;
            }
        } else {
            res.status(400).json({
                state: false,
                message: "Không được bỏ trống thông tin ID của Food!",
                data: []
            });
            return;
        }

        // Kiểm tra tồn tại category
        const existedCategory = await Category.getById(categoryId);
        if (categoryId) {
            if (typeof categoryId !== 'number') {
                res.status(404).json({
                    state: false,
                    message: "Phải nhập một số cho ID của Category!",
                    data: []
                });
                return;

            }
            if (existedCategory.length <= 0) {
                res.status(404).json({
                    state: false,
                    message: "Category không tồn tại!",
                    data: []
                });
                return;
            }
        }

        if (name && !isAlphaNumbericString(name)) {
            res.status(400).json({
                state: false,
                message: "Tên chỉ chấp nhận ký tự chữ, ký tự số và khoảng trắng!",
                data: []
            });
            return;
        }

        if (unit && !isAlphabeticString(unit)) {
            res.status(400).json({
                state: false,
                message: "Unit chỉ chấp nhận ký tự chữ!",
                data: []
            });
            return;
        }

        if (available && (Number(available) !== 1 && Number(available) !== 0)) {
            res.status(400).json({
                state: false,
                message: "Available chỉ chấp nhận giá trị 0 hoặc 1!",
                data: []
            });
            return;
        }

        const updatedTime = new Date();
        const updatedFood = await Food.findByIdAndUpdate(foodId, name, unit, image, Number(available), categoryId, updatedTime, updatedUser);
        const filterUpdatedFood = Array.isArray(updatedFood[0]) ? updatedFood[0] : [updatedFood[0]];

        const response = {
            state: true,
            message: "Cập nhật thông tin Food thành công!",
        }

        if (filterUpdatedFood.length > 0) {
            response.data = filterUpdatedFood;
            res.status(200);
        } else {
            response.state = false;
            response.message = "Cập nhật thông tin Food không thành công!";
            response.data = filterUpdatedFood;
            res.status(500);
        }
        res.json(response);
    } catch (err) {
        next(err);
    }

};

// GET LIST
export const getFoodList = async (req, res, next) => {

    const foodId = req.query.foodId || null;
    const k3y = req.query.key || null;
    const categoryId = req.query.categoryId || null;
    // Giới hạn số lượng mẫu dữ liệu trả về cho một trang. Ở đây page_limit = 10 nghĩa là một trang chỉ có 10 mẫu dữ liệu.
    const page_limit = 10;
    // Số trang được truyền từ endpoint, mặc định là 1.
    const page = Number(req.query.page) || 1;

    // Tính toán lại giá trị bắt đầu của offset dựa vào page.
    // page = 1, page_limit = 10. Điều này nghĩa là lấy từ vị trí 0-9. Như vậy offset có chỉ số bắt đầu là 0. 
    // Vậy offset = (1-1)*10 = 0;
    // page = 2, page_limit = 10. Lấy từ vị trí 10-19. Lúc này offset có chỉ số bắt đầu là từ 10.
    // Vậy offset = (2-1)*10 = 10;
    // Kiểm tra có phải đang truy vấn theo foodId không, nếu đúng thì offset mặc định luôn là 0.
    const off_set = (page - 1) * 10;

    try {

        // Truy vấn lấy thức ăn theo Id
        const getFood = await Food.getFoodList(foodId, k3y, categoryId, page_limit, off_set);
        // Vì kết quả là một mảng chứa 2 giá trị là mảng đối tượng cần tìm và các thông tin liên quan đến truy vấn SQL
        // nên cần lọc lại mảng getFood và chỉ lấy mảng đối tượng food.        
        const filterFoodArray = Array.isArray(getFood[0]) ? getFood[0] : [getFood[0]];

        // Lấy tổng số mẫu dữ liệu có trong bảng food, từ tổng số mẫu dữ liệu suy ra được tổng số trang.
        const totalFoods = Array.isArray(getFood[1]) ? getFood[1] : [getFood[1]];
        // Tính toán tổng số trang dựa trên tổng số mẫu dữ liệu có trong bảng food.
        const total_page = Math.ceil(totalFoods[0].total_rows / page_limit);

        // Tạo ra đối tượng response để gửi phản hồi.
        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        // Kiểm tra xem mảng đối tượng cần tìm có phần tử nào không. Nếu có thì trả về Output. Nếu không thì báo lỗi.
        if (filterFoodArray.length > 0) {
            // Định dạng lại dữ liệu của các đối tượng food có trong mảng filterFoodArray để làm output.
            const foods = filterFoodArray.map((food) => {
                const { categoryId, categoryName, price, type, ...otherDetails } = food;
                return {
                    ...otherDetails,
                    category: {
                        categoryId: categoryId,
                        categoryName: categoryName,
                    },
                    currentPrice: {
                        price: price,
                        type: type,
                    }
                }
            });

            // Output: Nếu là truy vấn theo foodId thì không trả về page.
            if (foodId) {
                response.data = foods;
                res.status(200);
            }
            else {
                response.data = foods;
                response.current_page = page;
                response.total_page = total_page;
                res.status(200);
            }
        } else {
            response.state = false;
            response.message = "Không tìm thấy dữ liệu!";
            response.data = filterFoodArray;
            res.status(404);
        }
        // Trả về phản hổi đến client.
        res.json(response);
    } catch (err) {
        next(createError(err));
    }
}