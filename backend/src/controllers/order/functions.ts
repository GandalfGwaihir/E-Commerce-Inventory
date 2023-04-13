import { Request, Response } from "express";
import { execute } from "../../db/mysql.connector";
import { OrderQueries } from "./queries";
import { ApiResponse } from "../../../types";
import { IOrderType } from "../../models/order.model";

export const getOrders = async (req: Request, res: Response) => {
    try {
        const orders = await execute<IOrderType[]>(OrderQueries.GetOrders, []);
        const response: ApiResponse<IOrderType[]> = {
            data : {
                value: orders,
            },
            statusCode: 200,
            statusMessage: "Orders fetched successfully"
        }
        return res.status(200).json(response);
    } catch (error) {
        res.status(400).json({
            error: error
        })
    }
}

export const insertOrder = async (req: Request, res: Response) => {
    try {
        const body: IOrderType = req.body;
        const { customerid, OrderName, CustomerNo, Price, DeliveryTimeDays, CustomerAdd } = body;
        const response = await execute<IOrderType>(OrderQueries.InsertOrder, [customerid, OrderName, CustomerNo, Price, DeliveryTimeDays, CustomerAdd]);
        if (response)    
            return res.status(200).json(response);
        else
            return res.status(400).json({ message: "Customer not added" });
    } catch (error) {
        return res.status(404).json({error : error})
    }
    /*
        req.body = {
            "customerid": "1",
            "OrderName": "Order 1",
            "CustomerNo": "1234567890",
            "Price": 1000,
            "DeliveryTimeDays": 10,
            "CustomerAdd": "Address 1"
        }
    */
}