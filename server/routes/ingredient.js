import express from "express";
import { getIngredientList } from "../controllers/ingredient_controller.js";
const router = express.Router();

// CREATE

// GET INGREDIENT LIST
router.get("/list", getIngredientList);


export default router;