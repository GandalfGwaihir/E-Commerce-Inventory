import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';



const Showpayments = () => {
    const [products, setShowpayments] = useState();
    useEffect(() => {
        const getProducts = async () => {
            const {data} = await baseInstance.get('/products/getProducts');
            setShowpayments(data.data.value);
            console.log(data)
        }
        getProducts();
    }, [])

    const buyNow = async (product_id) => {
        const customer_email_id = prompt("Enter your email id");
        const {data} = await baseInstance.post('/products/buyProduct', {
            product_id,
            customer_email_id
        });
        console.log(data);
    }
    
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
              
              <button class="bt1"
              onClick={() => buyNow(val.product_id)}
              >
               Buy now
              </button>
               
            </tr>
          );
        })}
      </table>
    </div>
  )
}

export default Showpayments;