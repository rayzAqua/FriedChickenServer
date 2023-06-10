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

class PriceListController {
  //[POST] /price-list/add
  async create(req, res, next) {
    const { userId, startDate, endDate, type } = req.body;

    try {
      const nowDate = new Date();
      const startdate = new Date(startDate);
      const enddate = new Date(endDate);
      if (
        !(startdate >= nowDate && enddate >= nowDate && startdate <= enddate)
      ) {
        return res.send(
          message(false, "Ngày bắt đầu và kết thúc không hợp lệ !", "")
        );
      }

      if (type == null || type == undefined) {
        return res.send(message(false, "Không được để trống type!", ""));
      }

      const respone = await Pricelist.create(type, startdate, enddate, userId);

      const priceList = await Pricelist.getById(respone["insertId"]);

      return res.send(
        message(true, "Thêm giá sản phẩm thành công!", priceList)
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Thêm giá sản phẩm thất bại!", ""));
    }
  }

  //GET /price-list/list
  async getList(req, res, next) {
    const page = req.query.page | 1;
    try {
      const priceList = await Pricelist.getList(calculateStart(page));

      const totalPage = calculateTotal(priceList.length);

      return res.send(
        message(true, "Lấy dữ liệu thành công!", priceList, page, totalPage)
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new PriceListController();
