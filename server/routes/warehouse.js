import express from "express";
import { getWarehouseListByStatus } from "../controllers/warehouse_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE

// UPDATE

// GET LIST WARE HOUSE BY STATUS
router.get("/list", getWarehouseListByStatus);


export default router;