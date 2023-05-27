import express from "express";
import { getIngredientList } from "../controllers/ingredient_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE

// GET INGREDIENT LIST
router.get("/list", authenticateToken, getIngredientList);


export default router;