import express from "express";
import AccountControllers from "../controllers/auth_controller.js";

const authRouter = express.Router();

authRouter.post("/sign-in", AccountControllers.signIn);

export default authRouter;
