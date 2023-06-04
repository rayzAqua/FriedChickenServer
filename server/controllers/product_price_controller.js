import { response } from "express";
import Customer from "../models/Customer.js";
import Food from "../models/Food.js";
import FoodstockHistory from "../models/FoodstockHistory.js";
import IngredientStockHistory from "../models/IngredientStockHistory.js";
import Order from "../models/Order.js";
import PaymentMethod from "../models/PaymentMethod.js";
import Promote from "../models/Promote.js";
import message from "../utils/message.js";
import Pricelist from "../models/Pricelist.js";
import ProductPrice from "../models/ProductPrice.js";

class ProductPriceController {
  //[POST] /product-price/add
  async create(req, res, next) {
    const { userId, productId, priceListId, price } = req.body;

    try {
      //check exist product
      const product = await Food.getById(productId);
      if (product.length == 0) {
        return res.send(message(false, "Sản phẩm không tồn tại!", ""));
      }

      //check exist pricelist
      const pricelist = await Pricelist.getOrderById(priceListId);
      if (pricelist.length == 0) {
        return res.send(message(false, "Giá không tồn tại!", ""));
      }

      const startDate = pricelist[0]["startDate"];
      const enddate = pricelist[0]["enddate"];
      const nowdate = new Date();

      //check valid date apply
      if (startDate > nowdate || enddate < nowdate) {
        return res.send(message(false, "Giá không thể áp dụng!", ""));
      }

      //check valid price
      if (price <= 0) {
        return res.send(message(false, "Giá sản phẩm phải lớn hơn 0!", ""));
      }

      //check duplication productPrice
      const productPrice = await ProductPrice.checkDuplicate(productId);
      if (productPrice.length > 0) {
        return res.send(
          message(false, "Tồn tại giá khác trong thời gian này!", "")
        );
      }

      await ProductPrice.create(productId, priceListId, price, userId);

      return res.send(message(true, "Thêm giá sản phẩm thành công!", ""));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new ProductPriceController();
