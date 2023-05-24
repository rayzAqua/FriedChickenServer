import authRouter from "./auth.js";
import orderRouter from "./order.js";
import foodRouter from "./food.js";

const routeHieuLe = (app) => {
  // Route của Hiếu Lê
  app.use("/api/foods/", foodRouter);
};

const routeHieuPhan = (app) => {
  // Route của Hiểu
  app.use("/account", authRouter);
  app.use("/order", orderRouter);
};

const routeTuanKiet = (app) => {
  // Route của Kiệt
};

const routes = (app) => {
  routeHieuLe(app);
  routeHieuPhan(app);
  routeTuanKiet(app);

  // Đường dẫn mặc định của server.
  app.use("/", (req, res) => {
    res.send(
      "WELCOME TO BACKEND SERVER!<br/>CREATE BY GROUP 20!<br/>HAVE FUN!"
    );
  });
  // Site route
};

export default routes;
