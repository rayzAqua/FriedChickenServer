import Food from "../models/Food.js";
import { createError } from "../utils/createError.js"

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

        console.log(filterFoodArray);

        // Tạo ra đối tượng response để gửi phản hồi.
        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        // Kiểm tra xem mảng đối tượng cần tìm có phần tử nào không. Nếu có thì trả về Output. Nếu không thì báo lỗi.
        if (filterFoodArray.length > 0) {
            // Định dạng lại dữ liệu của các đối tượng food có trong mảng filterFoodArray để làm output.
            const foods = filterFoodArray.map((food) => {
                const { categoryId, categoryName, foodPrice, type, ...otherDetails } = food;
                return {
                    ...otherDetails,
                    category: {
                        categoryId: categoryId,
                        categoryName: categoryName,
                    },
                    currentPrice: {
                        price: foodPrice,
                        type: type,
                    }
                }
            });

            // Output: Nếu là truy vấn theo foodId thì không trả về page.
            if (foodId) {
                response.data = foods;
                res.status(200);
            }
            // Nếu chiều dài mảng food bằng 1 thì kiểm tra xem có rơi vào các trường hợp sau không:
            // TH1: k3y = tên đích danh của món ăn -> trả về một món ăn duy nhất -> không phân trang.
            // TH2: k3y = categoryId và category này chỉ có một món ăn duy nhất -> trả về một món ăn -> không phân trang.
            // TH3: k3y = tên cụ thể của một category và category này chỉ có một món ăn duy nhất -> trả về một món -> không phân trang. 
            // TH4: page nhưng chỉ trả về 1 mẫu
            else if (foods.length === 1) {
                if (
                    (k3y && foods[0].name.toLowerCase().includes(k3y.toLowerCase())) ||
                    categoryId ||
                    (k3y && foods[0].category.categoryName.toLowerCase().includes(k3y.toLowerCase()))
                ) {
                    response.data = foods;
                    res.status(200);
                } else if (page) {
                    response.data = foods;
                    response.current_page = page;
                    response.total_page = total_page;
                    res.status(200);
                }
            }
            // Nếu không thuộc các TH trên thì phân trang bình thường.
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