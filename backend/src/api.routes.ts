import express from 'express';
import CustomerRoutes from './routes/customer.routes';
import OrderRoutes from './routes/order.routes'


const router = express.Router();
router.get('/', (req, res) => {
    res.status(200).send('API IS RUNNING');
});

router.use('/customer', CustomerRoutes); /* /api/customer */
router.use('/order', OrderRoutes); /* /api/order */

export default router;