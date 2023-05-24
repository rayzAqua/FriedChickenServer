import mysql from "mysql2";
import dotenv from "dotenv";
import util from "util";

dotenv.config();

// Kết nối đến MySQL.
export const connecting = mysql.createConnection({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

const query = util.promisify(connecting.query).bind(connecting);
export { query };
