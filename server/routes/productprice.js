import * as express from "express";
import ProductPriceController from "../controllers/product_price_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const productPriceRouter = express.Router();


productPriceRouter.post(
  "/add",
  authenticateToken,
  ProductPriceController.create
);

productPriceRouter.get(
  "/list",
  authenticateToken,
  ProductPriceController.getList
);

export default productPriceRouter;
