import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';

const Showpayments = () => {
    const [order, setShoworders] = useState();
    useEffect(() => {
        const getorder = async () => {
            const {data} = await baseInstance.get('/products/getProduct');
    
            setShoworders(data.data.value);
            console.log(data)
        }
        getorder();
    }, [])
  return (
    <div id="products">
         <table class="headingtop">
        <tr class="heading1">
          <th>Product description</th>
          <th>Product Category</th>
          <th>Product Quantity</th>
          <th>Product Name</th>
          <th> Product Price</th>
        </tr>
        {products && products.map((val, key) => {
          return (
            <tr key={key}>
              <td>{val.product_description}</td>
              <td>{val.category}</td>
              <td>{val.quantity}</td>
              <td>{val.product_name}</td>
              <td>{val.price}</td>
              <hr />
              <button  className="bt1">
                Delete
                </button>
              <a href='updated'>
              <button class="bt1">
               Buy now
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