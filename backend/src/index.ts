import express from 'express';
import cors from 'cors';
import apiRoutes from './api.routes';
import * as MySQLConnector from './db/mysql.connector';
import 'dotenv/config';


const app = express();
const port = process.env.PORT || 5000;

// create database pool
MySQLConnector.init();

// parse incoming request body and append data to `req.body`
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// enable all CORS request
app.use(cors());


app.use('/api/', apiRoutes);

app.get('/', (_req, res) => {
  res.status(200).send('SERVER IS RUNNING');
});

app.listen(port, () => {
  console.log(process.env.MY_SQL_DB_DATABASE);
  console.log(`Example app listening at http://localhost:${port}`)
});
