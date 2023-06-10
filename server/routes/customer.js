import express from "express";
import { getCustomerList, createCustomer, updateCustomer } from "../controllers/customer_controller.js";
import { authenticateToken } from "../middlewares/authentication.js";

const router = express.Router();

// CREATE
router.post("/add", createCustomer);

// UPDATE
router.post("/update", updateCustomer);

// GET LIST CUSTOMERS
router.get("/list", authenticateToken, getCustomerList);


export default router;