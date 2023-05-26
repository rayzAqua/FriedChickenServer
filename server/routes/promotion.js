import * as express from "express";
import PromotionController from "../controllers/promotion_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const promotionRouter = express.Router();

promotionRouter.get("/list", authenticateToken, PromotionController.list);

export default promotionRouter;
