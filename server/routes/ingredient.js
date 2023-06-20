import express from "express";
import {
  add,
  getIngredientList,
  update,
} from "../controllers/ingredient_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";
import { updateStock } from "../controllers/history_ingredient_controller.js";

const router = express.Router();

// CREATE
router.get("/list", authenticateToken, getIngredientList);
router.post("/update-stock", authenticateToken, updateStock);

// GET INGREDIENT LIST
router.post("/add", authenticateToken, add);
router.put("/update", authenticateToken, update);

export default router;
