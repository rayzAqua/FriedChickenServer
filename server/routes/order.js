import * as express from "express";
import OrderController from "../controllers/order_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const orderRouter = express.Router();

orderRouter.get("/list", authenticateToken, OrderController.getList);
orderRouter.post("/create", authenticateToken, OrderController.create);
orderRouter.patch(
  "/update-status",
  authenticateToken,
  OrderController.changeStatusOrder
);

// CACULATE POINT
orderRouter.get(
  "/calculate-point",
  authenticateToken,
  OrderController.calculatePoint
);

export default orderRouter;
