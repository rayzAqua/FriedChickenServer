import express from "express";
import { getFoodList, updateFood } from "../controllers/food_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE

// UPDATE FOOD
router.post("/update", updateFood);

// GET FOOD LIST
router.get("/list", authenticateToken, getFoodList);


export default router;