import express from "express";
import { createFood, getFoodList, updateFood } from "../controllers/food_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.post("/add", authenticateToken, createFood);

// UPDATE FOOD
router.put("/update", authenticateToken, updateFood);

// GET FOOD LIST
router.get("/list", authenticateToken, getFoodList);


export default router;