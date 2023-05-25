import express from "express";
import { getCustomerList, createCustomer } from "../controllers/customer_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.post("/add", authenticateToken, createCustomer);

// GET FOOD LIST
router.get("/list", getCustomerList);


export default router;