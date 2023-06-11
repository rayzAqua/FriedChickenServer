import * as express from "express";
import CategoryController from "../controllers/category_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const categoryRouter = express.Router();

categoryRouter.get("/list", authenticateToken, CategoryController.getList);

export default categoryRouter;
