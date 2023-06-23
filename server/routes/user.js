import express from "express";
import {
  createUser,
  getUserList,
  updateUser,
} from "../controllers/user_controller.js";
import {
  authenticateToken,
  checkRoleManage,
} from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.post("/add", checkRoleManage, createUser);

// UPDATE
router.put("/update", checkRoleManage, updateUser);

// GET LIST
router.get("/list", checkRoleManage, getUserList);

export default router;
