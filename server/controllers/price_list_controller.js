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
    let startDate = req.body.startDate || "";
    let endDate = req.body.endDate || "";
    let type = req.body.type || "";
    const userId = req.body.userId;

    try {
      if (startDate == "") {
        return res.send(
          message(false, "Không được để trống ngày bắt đầu!", "")
        );
      }
      if (endDate == "") {
        return res.send(
          message(false, "Không được để trống ngày kết thúc!", "")
        );
      }
      if (type == "") {
        return res.send(message(false, "Không được để trống loại!", ""));
      }

      let nowDate = new Date();
      nowDate = new Date(nowDate.toLocaleDateString());

      startDate = new Date(startDate);
      startDate = new Date(startDate.toLocaleDateString());
      endDate = new Date(endDate);
      endDate = new Date(endDate.toLocaleDateString());

      if (
        !(startDate >= nowDate && endDate >= nowDate && startDate <= startDate)
      ) {
        return res.send(
          message(false, "Ngày bắt đầu và kết thúc không hợp lệ !", "")
        );
      }

      let respone = await Pricelist.getListDouble(type, startDate, endDate);

      if (respone.length > 0) {
        return res.send(
          message(false, "Trùng thời gian với danh sách giá khác!", "")
        );
      }

      respone = await Pricelist.create(type, startDate, endDate, userId);

      // startDate = respone[0][0].startDate;
      // respone[0][0].startDate.setDate(startDate.getDate() + 1);
      // endDate = respone[0][0].endDate;
      // respone[0][0].endDate.setDate(endDate.getDate() + 1);

      return res.send(
        message(true, "Thêm giá sản phẩm thành công!", respone[0])
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Thêm giá sản phẩm thất bại!", ""));
    }
  }

  //GET /price-list/list
  async getList(req, res, next) {
    const page = req.query.page || 1;

    try {
      const priceList = await Pricelist.getList(calculateStart(page));
      // priceList.map((p) => {
      //   let startDate = p.startDate;
      //   p.startDate.setDate(startDate.getDate() + 1);
      //   let endDate = p.endDate;
      //   p.endDate.setDate(endDate.getDate() + 1);
      // });

      const totalPage = calculateTotal(priceList.length);

      return res.send(
        message(
          true,
          "Lấy dữ liệu thành công!",
          priceList,
          true,
          +page,
          totalPage
        )
      );
    } catch (error) {
      console.log(error);
      return res.send(message(false, "Lấy dữ liệu thất bại!", ""));
    }
  }
}

export default new PriceListController();
