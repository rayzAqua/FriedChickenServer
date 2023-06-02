import mysql from "mysql2";
import dotenv from "dotenv";
import util from "util";

dotenv.config();

// Kết nối đến MySQL.
export const connecting = mysql.createConnection({
  host: process.env.MYSQLHOST,
  user: process.env.MYSQLUSER,
  password: process.env.MYSQLPASSWORD,
  database: process.env.MYSQLDATABASE,
  port: process.env.MYSQLPORT,
});

// Chuyển đổi hàm callback-based thành promise-based function để xử lý bất đồng bộ.
export const query = util.promisify(connecting.query).bind(connecting);
