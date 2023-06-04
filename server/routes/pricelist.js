import * as express from "express";
import PriceListController from "../controllers/price_list_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const priceListRouter = express.Router();

priceListRouter.post("/add", authenticateToken, PriceListController.create);

priceListRouter.get("/list", authenticateToken, PriceListController.getList);

export default priceListRouter;
