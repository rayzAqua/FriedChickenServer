import express from "express";
import { createUser, getUserList, updateUser } from "../controllers/user_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.post("/add", authenticateToken, createUser);

// UPDATE
router.put("/update", authenticateToken, updateUser);

// GET LIST
router.get("/list", authenticateToken, getUserList);

export default router;