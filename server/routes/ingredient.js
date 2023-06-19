import express from "express";
import {
  add,
  getIngredientList,
  update,
} from "../controllers/ingredient_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.get("/list", authenticateToken, getIngredientList);

// GET INGREDIENT LIST
router.post("/add", authenticateToken, add);
router.put("/update", authenticateToken, update);

export default router;
