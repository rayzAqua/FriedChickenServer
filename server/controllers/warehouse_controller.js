import Warehouse from "../models/Warehouse.js";
import User from "../models/User.js";
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
            const newWarehouseList = await Promise.all(filterWarehouseList.map(async (warehouse) => {
                const { createdUser, createdTime, updatedUser, updatedTime, ...otherDetails } = warehouse;
            
                const [created, updated] = await Promise.all([
                    User.getById(createdUser),
                    User.getById(updatedUser)
                ]);
            
                return {
                    ...otherDetails,
                    createdUser: created.length > 0 ? created[0].name : null,
                    createdTime: createdTime,
                    updatedUser: updated.length > 0 ? updated[0].name : null,
                    updatedTime: updatedTime
                };
            }));


            response.data = newWarehouseList;
            res.status(200);
        } else {
            response.state = false;
            response.message = "Không tìm thấy dữ liệu!";
            response.data = filterWarehouseList;
            res.status(200);
        }
        res.json(response);
    } catch (err) {
        next(err);
    }
}