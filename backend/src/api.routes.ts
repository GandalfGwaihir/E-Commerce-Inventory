import express from 'express';
import CustomerRoutes from './routes/customer.routes';
import OrderRoutes from './routes/order.routes'
import productRoutes from './routes/product.routes';

const router = express.Router();
router.get('/', (_req, res) => {
    res.status(200).send('API IS RUNNING');
});

router.use('/customers', CustomerRoutes); /* /api/customer */
router.use('/orders', OrderRoutes); /* /api/order */
router.use('/products', productRoutes); /* /api/product */

export default router;