import { query } from "../sql_connect/connected.js";

class Warehouse {
  // Hàm khởi tạo
  constructor(warehouse) {
    this.wareHouseId = warehouse.wareHouseId;
    this.branchName = warehouse.branchName;
    this.warehouseName = warehouse.warehouseName;
    this.warehouseAddress = warehouse.warehouseAddress;
    this.status = warehouse.status;
    this.createdUser = warehouse.createdUser;
    this.updatedUser = warehouse.updatedUser;
    this.updatedTime = warehouse.updatedTime;
    this.createdTime = warehouse.createdTime;
  }
  // SP lấy warehouse theo id
  static async findById(warehouseId) {
    try {
      const sp = "CALL sp_get_warehouse_by_id(?);";
      const warehouse = await query(sp, [warehouseId]);
      return warehouse[0];
    } catch (err) {
      console.error("Error executing query: ", err);
      throw err;
    }
  }

  // SP lấy danh sách kho dựa vào status
  static async getWarehouseByStatus(status) {
    try {
      const sp = "CALL sp_get_warehouse_by_status(?);";
      const warehouseList = await query(sp, [status]);
      return warehouseList;
    } catch (err) {
      console.error("Error executing query: ", err);
      throw err;
    }
  }
}

export default Warehouse;
