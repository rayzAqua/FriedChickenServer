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
import User from "../models/User.js";
import calculateStart, { calculateTotal } from "../utils/calculateStart.js";

async function getMoreInfoProductPrice(res, result, page, totalPage) {
  const userPromises = [];

  // Loop through each tour productPrice and call User.getById for its ID
  result.forEach((productPrice) => {
    userPromises.push(User.getById(productPrice.productPriceCreatedUser));
  });

  try {
    const [userResponses] = await Promise.all([Promise.all(userPromises)]);
    const nowDate = new Date();
    result.map((productPrice, index) => {
      productPrice["userNameCreated"] = userResponses[index]["name"];
      const startDate = productPrice["startDate"];
      const endDate = productPrice["enddate"];
      if (startDate <= nowDate && endDate <= nowDate) {
        productPrice["isActive"] = true;
      } else productPrice["isActive"] = false;
    });

    res.send(
      message(true, "Lấy dữ liệu thành công!", result, true, page, totalPage)
    );
  } catch (error) {
    console.log(error);
    return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
  }
}
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
      const pricelist = await Pricelist.getById(priceListId);
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

  //GET /product-price/list
  async getList(req, res, next) {
    const foodId = req.query.foodId;
    const page = req.query.page | 1;
    try {
      const productPrice = await ProductPrice.getListByProductId(
        foodId,
        calculateStart(page)
      );

      const totalPage = calculateTotal(productPrice.length);
      getMoreInfoProductPrice(res, productPrice, page, totalPage);
      // return res.send(message(true, "Lấy dữ liệu thành công!", productPrice));
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new ProductPriceController();
