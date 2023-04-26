import express from "express";
import { getOrders, insertOrder } from "../controllers/order/functions";


const router = express.Router();

router.get('/', (_req, res) => {
    res.status(200).send(`ORDER API IS RUNNING at port = ${process.env.PORT}`);
});

router.get('/getOrders', getOrders);
router.post('/insertOrder', insertOrder);

export default router;