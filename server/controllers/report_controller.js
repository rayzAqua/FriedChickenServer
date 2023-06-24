import { query } from "../sql_connect/connected.js";
import Warehouse from "../models/Warehouse.js";
import { toValidDate } from "../utils/checkInput.js";

export const report = async (req, res, next) => {
  const from = req.query.from || null;
  const to = req.query.to || null;
  const wareHouseId = req.query.wareHouseId || null;
  const topCustomer = req.query.top || null;
  const currentDate = new Date();
  const fromDate = from ? (toValidDate(from).getTime() ? toValidDate(from) : null) : null;
  const toDate = to ? (toValidDate(to).getTime() ? toValidDate(to) : null) : null;

  try {
    if (fromDate > currentDate) {
      res.status(200).json({
        state: false,
        message:
          "Thời gian bắt đầu (FROM) không thể lớn hơn thời gian hiện tại",
        data: [],
      });
      return;
    }

    if (fromDate && toDate && fromDate > toDate) {
      res.status(200).json({
        state: false,
        message:
          "Thời gian bắt đầu (FROM) không thể lớn hơn thời gian kết thúc (TO)",
        data: [],
      });
      return;
    }
    if (wareHouseId == null) {
      return res.status(200).json({
        state: false,
        message: "Không được để trống mã kho!",
        data: [],
      });
    }

    const warehouse = await Warehouse.findById(wareHouseId);
    if (warehouse.length === 0) {
      res.status(200).json({
        state: false,
        message: "Kho không tồn tại!",
        data: [],
      });
      return;
    }

    const sp = "CALL sp_report(?, ?, ? ,?);";
    const report = await query(sp, [
      fromDate,
      toDate,
      wareHouseId,
      topCustomer,
    ]);
    const filterDateRevenueArray = Array.isArray(report[0])
      ? report[0]
      : [report[0]];
    const filterFoodRevenueArray = Array.isArray(report[1])
      ? report[1]
      : [report[1]];
    const filterCustomerRevenueArray = Array.isArray(report[2])
      ? report[2]
      : [report[2]];

    if (
      filterDateRevenueArray.length > 0 &&
      filterFoodRevenueArray.length > 0 &&
      filterCustomerRevenueArray.length > 0
    ) {
      const dateRevenues = filterDateRevenueArray.map((dateRevenue) => {
        const { reportDate, totalRevenue, cash, banking, eWallet, other, ...otherDetails } = dateRevenue;
        const date = new Date(reportDate).toLocaleDateString();
        return {
          [date]: {
            totalRevenue: Number(totalRevenue),
            cash: Number(cash),
            banking: Number(banking),
            eWallet: Number(eWallet),
            other: Number(other),
            ...otherDetails,
          },
        };
      });

      const foodRevenues = filterFoodRevenueArray.map((foodRevenue) => {
        const { quantity, totalRevenue, ...otherDetails } = foodRevenue;
        return {
          ...otherDetails,
          quantity: quantity ? Number(quantity) : null,
          totalRevenue: totalRevenue ? Number(totalRevenue) : null
        };
      });

      const customerRevenues = filterCustomerRevenueArray.map((customerRevenue) => {
        const { point, totalRevenue, ...otherDetails } = customerRevenue;
        return {
          ...otherDetails,
          totalRevenue: totalRevenue ? Number(totalRevenue) : null,
          earnedPoint: point
        };
      }
      );

      const data = {
        revenue: dateRevenues,
        foodSale: foodRevenues,
        customer: customerRevenues,
      };

      res.status(200).json({
        state: true,
        message: "Lấy dữ liệu thành công!",
        data: data,
      });
    } else {
      res.status(200).json({
        state: false,
        message: "Không tìm thấy dữ liệu!",
        data: [],
      });
    }
  } catch (err) {
    next(err);
  }
};
