import { query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class Warehouse {
  // Hàm khởi tạo
  constructor() {
    this.wareHouseId = null;
    this.branchName = null;
    this.warehouseName = null;
    this.warehouseAddress = null;
    this.status = null;
    this.createdUser = null;
    this.updatedUser = null;
    this.updatedTime = null;
    this.createdTime = null;
  }

  setWarehouse(warehouse) {
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
  async findById(warehouseId) {
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
  async getWarehouseByStatus(status) {
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

const warehouse = Singleton.getModel('warehouse', Warehouse);

export default warehouse;
