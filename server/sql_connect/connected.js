import mysql from "mysql2";
import dotenv from "dotenv";
import util from "util";

dotenv.config();

// Kết nối đến MySQL.
export const connecting = mysql.createConnection({
  host: process.env.MYSQL_URL,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

// Chuyển đổi hàm callback-based thành promise-based function để xử lý bất đồng bộ.
export const query = util.promisify(connecting.query).bind(connecting);
