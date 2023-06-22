import {createError} from '../utils/createError.js'
import Ingredient from '../models/Ingredient.js'
import User from '../models/User.js'
import message from '../utils/message.js'

// GET LIST
export const getIngredientList = async (req, res, next) => {
    const ingredientId = req.query.ingredientId || null
    const k3y = req.query.key || null
    const wareHouseId = req.query.wareHouseId || null
    const page_limit = 10
    const page = Number(req.query.page) || 1

    // Tính toán ra vị trí lấy mẫu dữ liệu cho một trang dựa vào page được truyền vào từ req.
    const off_Set = (page - 1) * 10

    try {
        // Truy vấn dữ liệu từ sp_get_ingredient_list()
        const getIngredient = await Ingredient.getIngredientList(ingredientId, k3y, wareHouseId, page_limit, off_Set)
        // Lọc lại kết quả trả về sau khi thực hiện truy vấn trên.
        const filterIngredientArray = Array.isArray(getIngredient[0]) ? getIngredient[0] : [getIngredient[0]]

        // Lọc và lấy ra tổng số lượng các mẫu dữ liệu có trong bảng ingredient.
        const totalIngredients = Array.isArray(getIngredient[1]) ? getIngredient[1] : [getIngredient[1]]
        // Tính toán ra tổng số trang dựa vào tổng số mẫu dữ liệu của bảng ingredient và giới hạn mẫu dữ liệu cho một trang.
        const total_page = Math.ceil(totalIngredients[0].total_ingredients / page_limit)

        // Tạo ra đối tượng response để gửi phản hồi.
        const response = {
            state: true,
            message: 'Lấy dữ liệu thành công!',
        }

        // Kiểm tra xem mảng sau khi truy vấn có kết quả không, nếu có thì tiếp tục xử lý, nếu không thì thông báo
        // lỗi 404 - Không tìm thấy dữ liệu.
        if (filterIngredientArray.length > 0) {
            const newIngredientArray = await Promise.all(
                filterIngredientArray.map(async (ingredient) => {
                    const {createdUser, createdTime, updatedUser, updatedTime, ...otherDetails} = ingredient

                    const [created, updated] = await Promise.all([User.getById(createdUser), User.getById(updatedUser)])

                    return {
                        ...otherDetails,
                        createdUser: created.length > 0 ? created[0].name : null,
                        createdTime: createdTime,
                        updatedUser: updated.length > 0 ? updated[0].name : null,
                        updatedTime: updatedTime,
                    }
                }),
            )

            // Định dạng lại kết quả trả về từ truy vấn SP để làm Output.
            const ingredients = newIngredientArray.map((ingredient) => {
                const {warehouseName, quantity, ...otherDetails} = ingredient
                return {
                    ...otherDetails,
                    inStock: quantity !== null ? Number(quantity) : quantity,
                }
            })

            // Nếu truy vấn theo ingredientId thì:
            if (ingredientId) {
                response.data = ingredients
                res.status(200)
            } else {
                response.data = ingredients
                response.current_page = page
                response.total_page = total_page
                res.status(200)
            }
        }
        // Không có kết quả truy vấn.
        else {
            response.state = false
            response.message = 'Không lấy được dữ liệu!'
            response.data = filterIngredientArray
            // res.status(404);
        }
        // OUTPUT
        res.json(response)
    } catch (err) {
        next(err)
    }
}

//[POST] /ingredient/add
export async function add(req, res, next) {
    const name = req.body.name || ''
    const unit = req.body.unit || ''
    const image = req.body.image || ''
    const userId = req.body.userId
    try {
        if (name == '') {
            return res.send(message(false, 'Không được để trống tên nguyên liệu!'))
        }
        if (unit == '') {
            return res.send(message(false, 'Không được để trống đơn vị!'))
        }

        let ingredient = await Ingredient.create(name, unit, image, userId)
        ingredient = await Ingredient.getIngredientById(ingredient[0]['last_insert_id()'])

        return res.send(message(true, 'Thêm nguyên liệu thành công!', ingredient))
    } catch (error) {
        console.log(error)
        return res.send(message(false, 'Thêm nguyên liệu thất bại!'))
    }
}

//[PUT] /ingredient/update
export async function update(req, res, next) {
    const ingredientId = req.body.ingredientId || -1
    const name = req.body.name || ''
    const unit = req.body.unit || ''
    const image = req.body.image || ''
    const userId = req.body.userId
    try {
        if (+ingredientId < 0) {
            return res.send(message(false, 'Không được để trống mã nguyên liệu!'))
        }
        if (name == '') {
            return res.send(message(false, 'Không được để trống tên nguyên liệu!'))
        }
        if (unit == '') {
            return res.send(message(false, 'Không được để trống đơn vị!'))
        }

        let ingredient = await Ingredient.update(ingredientId, name, unit, image, userId)
        ingredient = await Ingredient.getIngredientById(ingredientId)

        return res.send(message(true, 'Cập nhật nguyên liệu thành công!', ingredient))
    } catch (error) {
        console.log(error)
        return res.send(message(false, 'Cập nhật nguyên liệu thất bại!'))
    }
}
