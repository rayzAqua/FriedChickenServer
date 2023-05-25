import express from "express";
import { getCustomerList, createCustomer } from "../controllers/customer_controller.js";

const router = express.Router();

// CREATE
router.post("/add", createCustomer);

// GET FOOD LIST
router.get("/list", getCustomerList);


export default router;