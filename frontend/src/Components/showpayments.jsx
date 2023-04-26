import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';

const Showpayments = () => {
    const [order, setShowpayments] = useState();
    useEffect(() => {
        const getorder = async () => {
            const {data} = await baseInstance.get('/Products/getProduct');
    
            setShoworders(data.data.value);
            console.log(data)
        }
        getPayment();
    }, [])
  return (
    <div>
         <table class="headingtop">
        <tr class="heading1">
          <th>Product description</th>
          <th>Product Category</th>
          <th>Product Quantity</th>
          <th>Product Name</th>
        </tr>
        {order && order.map((val, key) => {
          return (
            <tr key={key}>
              <td>{val.product_description}</td>
              <td>{val.category}</td>
              <td>{val.quantity}</td>
              <td>{val.product_name}</td>
              <hr />
              <button  className="bt1">
                Delete
                </button>
              <a href='updated'>
              <button class="bt1">
               Update
              </button>
               </a>
            </tr>
          );
        })}
      </table>
    </div>
  )
}

export default Showpayments;