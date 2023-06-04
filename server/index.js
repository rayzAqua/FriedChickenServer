import express from "express";
import dotenv from "dotenv";
import { connecting } from "./sql_connect/connected.js";
import routes from "./routes/routes.js";
import cors from "cors";

// Khai báo các thư viện sử dụng.
const app = express();
dotenv.config();
app.use(
  cors({
    origin: "*",
  })
);
// Port cho server.
const port = process.env.PORT;

// Middleware cho phép phân tích nội dung được gửi từ request dưới dạng json.
app.use(express.json());

// Routes
routes(app);

// Đăng ký một middleware để bắt lỗi. Khi hàm xử lý gặp lỗi, nếu hàm được truyền vào callback next thì sẽ trực tiếp bỏ qua
// tất cả middleware khác và chạy vào middleware này để trả về lỗi
app.use((err, req, res, next) => {
  const errStatus = err.status || 500;
  const errMessage = err.message || "Undetermined error!";
  return res.status(errStatus).json({
    success: false,
    status: errStatus,
    message: errMessage,
    stack: err.stack,
  });
});

// Kết nối đến Database!
connecting.connect((err) => {
  if (err) {
    console.log("Can't connect to Database!");
    console.log(err.stack);
    return;
  }

  console.log("Connected to Database!");
});

// Mở một kết nối để lắng nghe các request và gửi response.
app.listen(3000, () => {
  console.log("Connected to server at port " + 3000 + "!");
});
