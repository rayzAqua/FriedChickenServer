import { createError } from "../utils/createError.js";
import Ingredient from "../models/Ingredient.js";
import User from "../models/User.js";
import IngredientStockHistory from "../models/IngredientStockHistory.js";
import message from "../utils/message.js";
import Warehouse from "../models/Warehouse.js";

//[POST] ingredient/update-stock
export async function updateStock(req, res, next) {
  const quantity = req.body.quantity || 0;
  const price = req.body.price || -1;
  const wareHouseId = req.body.wareHouseId || -1;
  const ingredientId = req.body.ingredientId || -1;
  const userId = req.body.userId;
  try {
    if (quantity == 0) {
      return res.send(message(false, "Số lượng phải khác 0!"));
    }
    if (quantity > 0 && price < 1) {
      return res.send(message(false, "Giá phải lớn hơn 0!"));
    }

    if (ingredientId < 0) {
      return res.send(message(false, "Thành phần không tồn tại!"));
    }

    const warehouse = await Warehouse.findById(wareHouseId);

    if (warehouse.length == 0) {
      return res.send(message(false, "Kho không tồn tại!"));
    }

    const status = warehouse[0].status;

    if (
      quantity > 0 &&
      !(quantity > 0 && (status == "Active" || status == "Empty"))
    ) {
      return res.send(
        message(
          false,
          "Không thể nhập nguyên liệu vào kho này, do kho không hoạt động hoặc đã bị đầy!"
        )
      );
    }
    if (
      quantity < 0 &&
      !(quantity < 0 && (status == "Active" || status == "Full"))
    ) {
      return res.send(
        message(
          false,
          "Không thể xuất nguyên liệu khỏi kho này, do kho không hoạt động hoạt kho đang trống!"
        )
      );
    }

    let ingredientStockHistory =
      await IngredientStockHistory.getQuantityAvailable(
        wareHouseId,
        ingredientId
      );

    let inStock = ingredientStockHistory[0].SoLuongTon;

    if (inStock == null) {
      if (quantity < 0)
        return res.send(
          message(false, "Không tồn tại nguyên liệu đó trong kho này!")
        );
      inStock = 0;
    }

    inStock = +inStock + quantity;
    if (quantity < 0 && inStock < 0) {
      return res.send(message(false, "Số lượng nguyên liệu không đủ để xuất!"));
    }

    ingredientStockHistory = await IngredientStockHistory.create(
      quantity,
      price,
      userId,
      wareHouseId,
      ingredientId
    );
    ingredientStockHistory[0]["inStock"] = inStock;
    return res.send(
      message(true, "Nhập xuất nguyên liệu thành công!", ingredientStockHistory)
    );
  } catch (error) {
    console.log(error);
    return res.send(message(false, "Nhập xuất nguyên liệu thất bại!"));
  }
}

//[PUT] /ingredient/update
export async function update(req, res, next) {
  const ingredientId = req.body.ingredientId || -1;
  const name = req.body.name || "";
  const unit = req.body.unit || "";
  const image = req.body.image || "";
  const userId = req.body.userId;
  try {
    if (+ingredientId < 0) {
      return res.send(message(false, "Không được để trống mã nguyên liệu!"));
    }
    if (name == "") {
      return res.send(message(false, "Không được để trống tên nguyên liệu!"));
    }
    if (unit == "") {
      return res.send(message(false, "Không được để trống đơn vị!"));
    }

    let ingredient = await Ingredient.update(
      ingredientId,
      name,
      unit,
      image,
      userId
    );
    ingredient = await Ingredient.getIngredientById(ingredientId);

    return res.send(
      message(true, "Cập nhật nguyên liệu thành công!", ingredient)
    );
  } catch (error) {
    console.log(error);
    return res.send(message(false, "Cập nhật nguyên liệu thất bại!"));
  }
}
