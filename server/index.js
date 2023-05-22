import express from "express";
import dotenv from "dotenv";
import { connecting } from "./sql_connect/connected.js";
import route from "./routes/index.js";
// Khai báo các thư viện sử dụng.
const app = express();
dotenv.config();

// Port cho server.
const port = process.env.PORT;

// Middleware cho phép phân tích nội dung được gửi từ request dưới dạng json.
app.use(express.json());

// Đường dẫn mặc định của server.
app.use("/", (req, res) => {
  res.send("WELCOME TO BACKEND SERVER!<br/>CREATE BY GROUP 20!<br/>HAVE FUN!");
});

route(app);

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
    console.log("Can't not connect to Database!");
    console.log(err.stack);
    return;
  }

  console.log("Connected to Database!");
});

// Mở một kết nối để lắng nghe các request và gửi response.
app.listen(port, () => {
  console.log("Connected to server at port " + port + "!");
});
