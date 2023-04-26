import express from 'express';
import { getProducts, getProduct, addProduct, deleteProduct, updateProduct } from '../controllers/product/functions';

const router = express.Router();
router.get('/getProducts', getProducts);
router.get('/getProducts/:id', getProduct);
router.post('/addProduct', addProduct);
router.delete('/deleteProduct/:product', deleteProduct)
router.put('/updateProduct/:id', updateProduct)

export default router;