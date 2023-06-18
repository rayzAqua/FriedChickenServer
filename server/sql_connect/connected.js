import mysql from "mysql2";
import dotenv from "dotenv";
import util from "util";

dotenv.config();

// Class tạo kết nối đến MySQL.
class Database {
  constructor() {
    this.connection = null;
  }

  connect() {
    dotenv.config();

    this.connection = mysql.createConnection({
      host: process.env.HOST,
      user: process.env.USER,
      password: process.env.PASSWORD,
      database: process.env.DATABASE,
      port: process.env.PORT,
    });
    return this.connection;
  }
}

// Singleton Pattern đảm bảo chỉ có một thể hiện của đối tượng Database.
const Singleton = (function() {

  let instance = null;

  function createDBConnecting() {
      const database = new Database();
      const connecting = database.connect();
      return connecting;
  }

  return {
      getDBConnecting: function() {
          if (!instance) {
              instance = createDBConnecting();
          }
          return instance;
      }
  }
})();

// Khởi tạo kết nối đến MySQL
export const connecting = Singleton.getDBConnecting();

// Chuyển đổi hàm callback-based thành promise-based function để xử lý bất đồng bộ.
export const query = util.promisify(connecting.query).bind(connecting);
