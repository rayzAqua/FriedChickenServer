import express from "express";
import { getFoodList } from "../controllers/food_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE

// GET FOOD LIST
router.get("/list", getFoodList);


export default router;