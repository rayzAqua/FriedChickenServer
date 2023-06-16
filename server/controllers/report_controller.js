import { query } from "../sql_connect/connected.js";
import Warehouse from "../models/Warehouse.js";

export const report = async (req, res, next) => {
    const from = req.body.from;
    const to = req.body.to;
    const wareHouseId = Number(req.body.wareHouseId);
    const topCustomer = Number(req.body.top);

    const currentDate = new Date();
    const fromDate = new Date(from);
    const toDate = new Date(to);

    try {

        if (fromDate >= currentDate) {
            res.status(400).json({
                state: false,
                message: "Thời gian bắt đầu (FROM) không thể lớn hơn thời gian hiện tại",
                data: []
            });
            return;
        }

        if (fromDate > toDate) {
            res.status(400).json({
                state: false,
                message: "Thời gian bắt đầu (FROM) không thể lớn hơn thời gian kết thúc (TO)",
                data: []
            });
            return;
        }

        const warehouse = await Warehouse.findById(wareHouseId);
        if (warehouse.length === 0) {
            res.status(404).json({
                state: false,
                message: "Kho không tồn tại!",
                data: []
            });
            return;
        }

        const sp = "CALL sp_report(?, ?, ? ,?);"
        const report = await query(sp, [fromDate, toDate, wareHouseId, topCustomer]);
        const filterDateRevenueArray = Array.isArray(report[0]) ? report[0] : [report[0]];
        const filterFoodRevenueArray = Array.isArray(report[1]) ? report[1] : [report[1]];
        const filterCustomerRevenueArray = Array.isArray(report[2]) ? report[1] : [report[1]];

        if (filterDateRevenueArray.length > 0 && filterFoodRevenueArray.length > 0 && filterCustomerRevenueArray.length > 0) {
            const dateRevenues = filterDateRevenueArray.map((dateRevenue) => {
                const { reportDate, ...otherDetails } = dateRevenue;
                const date = new Date(reportDate).toLocaleDateString();
                return {
                    [date]: {
                        ...otherDetails,
                    }
                };
            });

            const foodRevenues = filterFoodRevenueArray.map((foodRevenue) => {
                return foodRevenue;
            });

            const customerRevenues = filterCustomerRevenueArray.map((customerRevenue) => {
                return customerRevenue;
            });

            const data = {
                revenue: dateRevenues,
                foodSale: foodRevenues,
                customer: customerRevenues
            }

            res.status(200).json({
                state: true,
                message: "Lấy dữ liệu thành công!",
                data: data
            });
        }
    } catch (err) {
        next(err);
    }
}