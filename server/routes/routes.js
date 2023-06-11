import authRouter from "./auth.js";
import orderRouter from "./order.js";
import foodRouter from "./food.js";
import customerRouter from "./customer.js";
import promotionRouter from "./promotion.js";
import ingredientRouter from "./ingredient.js";
import productPriceRouter from "./productprice.js";
import priceListRouter from "./pricelist.js";
import warehouseRouter from "./warehouse.js";
import reportRouter from "./report.js";

const routeHieuLe = (app) => {
  // Route của Hiếu Lê
  app.use("/order", orderRouter);
  app.use("/food", foodRouter);
  app.use("/customer", customerRouter);
  app.use("/ingredient", ingredientRouter);
  app.use("/ware-house", warehouseRouter);
  app.use("/report", reportRouter);
};

const routeHieuPhan = (app) => {
  // Route của Hiểu
  app.use("/account", authRouter);
  app.use("/order", orderRouter);
  app.use("/promotion", promotionRouter);
  app.use("/payment-method", promotionRouter);
  app.use("/product-price", productPriceRouter);
  app.use("/price-list", priceListRouter);
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
