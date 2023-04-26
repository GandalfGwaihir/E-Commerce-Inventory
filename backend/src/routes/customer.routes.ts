import express from 'express';
import { getCustomers, addCustomer, getCustomerWithBounds, deleteCustomer, updateCustomer, getProductByEmail } from '../controllers/customers/functions';

const router = express.Router();
router.get('/', (_req, res) => {
    res.send(`CUSTOMER API IS RUNNING at port = ${process.env.PORT}`);
});
router.get('/getCustomers', getCustomers);
router.get('/getCustomers/:pageNo', getCustomerWithBounds);
router.post('/addCustomer', addCustomer);
router.delete('/deleteCustomer/:customer_id', deleteCustomer);
router.put('/updateCustomer/:id', updateCustomer);
router.post('/getProducts', getProductByEmail);

export default router;