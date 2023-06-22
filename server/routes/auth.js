import * as express from "express";
import AuthController from "../controllers/auth_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
const authRouter = express.Router();

authRouter.post("/sign-in", AuthController.logIn);
authRouter.patch(
  "/change-password",
  authenticateToken,
  AuthController.changePassword
);

export default authRouter;
