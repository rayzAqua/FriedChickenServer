import * as express from "express";
import AuthController from "../controllers/auth_controller.js";
const authRouter = express.Router();

authRouter.post("/sign-in", AuthController.logIn);

export default authRouter;
