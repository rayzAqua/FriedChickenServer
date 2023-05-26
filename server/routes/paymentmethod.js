import * as express from "express";
import PaymentMethodController from "../controllers/payment_method_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const paymentMethodRouter = express.Router();

paymentMethodRouter.get(
  "/list",
  authenticateToken,
  PaymentMethodController.list
);

export default paymentMethodRouter;
