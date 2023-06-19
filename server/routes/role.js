import * as express from "express";
import OrderController from "../controllers/order_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
import RoleController from "../controllers/role_controller.js";
const roleRouter = express.Router();

roleRouter.get("/list", authenticateToken, RoleController.getList);

export default roleRouter;
