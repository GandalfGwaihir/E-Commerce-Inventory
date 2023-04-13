import { Request, Response } from "express";
import { execute } from "../../db/mysql.connector";
import { CustomerQueries } from "./queries";
import { ICustomerType } from "../../models/customer.models";
import { ApiResponse } from "../../../types";

export const getCustomers = async (req: Request, res: Response) => {
    try {
        const customers = await execute<ICustomerType[]>(CustomerQueries.GetCustomers, []);
        const response: ApiResponse<ICustomerType[]> = {
            data : {
                value: customers,
            },
            statusCode: 200,
            statusMessage: "Customers fetched successfully"
        }
        return res.status(200).json(response);
    } catch (error) {
        res.status(400).json({
            error: error
        })
    }
}

export const getCustomerWithBounds = async (req: Request, res: Response) => {
    try {
        const pageNo : number = Number(req.params.pageNo) || 1;
        const maxResultsOnPage = 5;
        const lowerBound = (pageNo - 1) * maxResultsOnPage;
        const upperBound = pageNo * maxResultsOnPage;
        const customers = await execute<[ICustomerType[], any]>(CustomerQueries.GetCustomersWithBounds, [lowerBound, upperBound])
        const infoBody = {
                length: customers[0].length,
                currentPage: pageNo,
                nextPage: pageNo + 1,
                isLastPage: customers[0].length < maxResultsOnPage
            }
        const response: ApiResponse<ICustomerType[]> = {
            data: {
                value: customers[0],
                others: infoBody
            },
            statusCode: 200,
            statusMessage: "Customers returned successfully"
        } 
        return res.status(200).json(response);
    } catch (error) {
        res.status(400).json({
            error: error
        })
    }
}

export const addCustomer = async (req: Request, res: Response) => {
    try {
        const body : ICustomerType = req.body;
        const { email_id, phone_no, first_name, last_name, name_id, address_id, country, state, city, flat, pincode } = body;
        const response = await execute<ICustomerType>(
            CustomerQueries.InsertCustomer, 
            [email_id, phone_no, first_name, last_name, country, state, city, flat, pincode]
        )
        if (response)    
            return res.status(200).json(response);
        else
            return res.status(400).json({ message: "Customer not added" });
    } catch (error) {
        return res.status(404).json({error : error})
    }
    /*
    Example request body:
    {
        "email_id": "john.doe@xyz.ghi",
        "phone_no": 1234567890,
        "first_name": "John",
        "last_name": "Doe",
        "country": "India",
        "state": "Maharashtra",
        "city": "Mumbai",
        "flat": "Flat 1",
        "pincode": 400001
    }
    */
}

export const updateCustomer = async (req: Request, res: Response) => {
    try {
        const body : ICustomerType = req.body;
        const { customer_id, email_id, phone_no, first_name, last_name, name_id, address_id, country, state, city, flat, pincode } = body;
        const response = await execute<ICustomerType>(
            CustomerQueries.UpdateCustomer, 
            [customer_id, email_id, phone_no, first_name, last_name, country, state, city, flat, pincode, name_id]
        )
        if (response)    
            return res.status(200).json(response);
        else
            return res.status(400).json({ message: "Customer not updated" });
    } catch (error) {
        return res.status(404).json({error : error})
    }
}