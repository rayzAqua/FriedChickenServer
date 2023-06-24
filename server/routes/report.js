import express from "express";
import {
  authenticateToken,
  checkRoleManage,
} from "../middlewares/authentication.js";
import { report } from "../controllers/report_controller.js";

const router = express.Router();

// CREATE

// GET INGREDIENT LIST
router.get("/", checkRoleManage, report);

export default router;
