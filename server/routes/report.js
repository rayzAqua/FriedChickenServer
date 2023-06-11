import express from "express";
import { authenticateToken } from "../middlewares/authentication.js";
import { report } from "../controllers/report_controller.js";

const router = express.Router();

// CREATE

// GET INGREDIENT LIST
router.get("/", authenticateToken, report);

export default router;