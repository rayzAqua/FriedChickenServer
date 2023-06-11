import Warehouse from "../models/Warehouse.js";
import { isAlphaNumbericString } from "../utils/checkInput.js";

// GET LIST WAREHOUSE BY STATUS
export const getWarehouseListByStatus = async (req, res, next) => {
    const status = req.query.status || null

    try {
        const warehouseList = await Warehouse.getWarehouseByStatus(status);
        const filterWarehouseList = Array.isArray(warehouseList[0]) ? warehouseList[0] : [warehouseList[0]];

        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        if (filterWarehouseList.length > 0) {
            response.data = filterWarehouseList;
            res.status(200);
        } else {
            response.state = false;
            response.message = "Không tìm thấy dữ liệu!";
            response.data = filterWarehouseList;
            res.status(404);
        }
        res.json(response);
    } catch (err) {
        next(err);
    }
}