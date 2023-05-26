import { createError } from "../utils/createError.js";
import Ingredient from "../models/Ingredient.js";

// GET LIST
export const getIngredientList = async (req, res, next) => {

    const ingredientId = req.query.ingredientId || null;
    const ingredientName = req.query.ingredientName || null;
    const wareHouseId = req.query.wareHouseId || null;
    // Giới hạn số mẫu dữ liệu trong một trang
    const page_limit = 10;
    // Số trang hiện tại được truyền từ req
    const page = Number(req.query.page) || 1;

    // Tính toán ra vị trí lấy mẫu dữ liệu cho một trang dựa vào page được truyền vào từ req.
    const off_Set = (page - 1) * 10;

    try {
        // Truy vấn dữ liệu từ sp_get_ingredient_list()
        const getIngredient = await Ingredient.getIngredientList(ingredientId, ingredientName, wareHouseId, page_limit, off_Set);
        // Lọc lại kết quả trả về sau khi thực hiện truy vấn trên.
        const filterIngredientArray = Array.isArray(getIngredient[0]) ? getIngredient[0] : [getIngredient[0]];

        // Lọc và lấy ra tổng số lượng các mẫu dữ liệu có trong bảng ingredient.
        const totalIngredients = Array.isArray(getIngredient[1]) ? getIngredient[1] : [getIngredient[1]];
        // Tính toán ra tổng số trang dựa vào tổng số mẫu dữ liệu của bảng ingredient và giới hạn mẫu dữ liệu cho một trang.
        const total_page = Math.ceil(totalIngredients[0].total_ingredients / page_limit);

        // Tạo ra đối tượng response để gửi phản hồi.
        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        // Kiểm tra xem mảng sau khi truy vấn có kết quả không, nếu có thì tiếp tục xử lý, nếu không thì thông báo
        // lỗi 404 - Không tìm thấy dữ liệu.
        if (filterIngredientArray.length > 0) {

            // Định dạng lại kết quả trả về từ truy vấn SP để làm Output.
            const ingredients = filterIngredientArray.map((ingredient) => {
                const {warehouseName, quantity, ...otherDetails} = ingredient;
                return {
                    ...otherDetails,
                    inStock: quantity,
                }
            });

            // Nếu truy vấn theo ingredientId thì:
            if(ingredientId || (ingredientName && filterIngredientArray.length === 1)) {
                // TH1: Kiểm tra xem có truy vấn kết hợp trường ingredientId với trường wareHouseId không, nếu có thì chỉ trả về 
                // duy nhất một đối tượng theo cả ingredientId và wareHouseId -> không phân trang.
                // TH2: Kiểm tra xem có phải đang truy vấn theo ingredientName và chỉ đích danh ingredient đó không (độ dài mảng
                // kết quả filterIngredientFood == 1). Nếu đúng như vậy thì kiểm tra xem có kết hợp với trường wareHouseId không.
                // Nếu có kết hợp thì tả về một đối tượng duy nhất -> không phân trang.
                if(wareHouseId) {
                    response.data = ingredients;
                    res.status(200);
                }
                // Nếu không truy vấn kết hợp trường ingredientId (hoặc ingredientName đích danh) với trường wareHouseId
                // thì vẫn trả về duy nhất một đối tượng theo ingredientId (hoặc ingredientName đích danh) -> không phân trang.
                else {
                    response.data = ingredients;
                    res.status(200);
                }
            }
            // Không theo ingredientId, ingredientId kết hợp wareHouseId hoặc ingredientName đích danh kết hợp với wareHouseId thì
            // trả về phân trang. 
            else {
                response.data = {
                    ingredientList: ingredients,
                    current_page: page,
                    total_page: total_page,
                };
                res.status(200);
            }
        } 
        // Không có kết quả truy vấn.
        else {
            response.state = false;
            response.message = "Không lấy được dữ liệu!";
            response.data = filterIngredientArray;
            res.status(404);
        }
        // OUTPUT
        res.json(response);
    } catch (err) {
        next(err);
    }
}