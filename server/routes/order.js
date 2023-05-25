import * as express from "express";
import OrderController from "../controllers/order_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const orderRouter = express.Router();

orderRouter.get("/list", authenticateToken, OrderController.getList);
orderRouter.post("/create", authenticateToken, OrderController.create);

export default orderRouter;
