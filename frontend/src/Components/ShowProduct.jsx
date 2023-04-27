import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';



const ShowProducts = () => {
    const [products, setProducts] = useState();
    useEffect(() => {
        const getorder = async () => {
            const {data} = await baseInstance.get('/products/getProducts');
    
            setProducts(data.data.value);
            console.log(data)
        }
        getorder();
    }, [])

    const buyNow = async (product_id) => {
        const customer_email_id = prompt("Enter your email id");
        const {data} = await baseInstance.post('/products/buyProduct', {
            product_id,
            customer_email_id
        });
        console.log(data);
        alert(data?.message)
    }

    const deleteProduct = async (product_id) => {
        const {data} = await baseInstance.delete(`/products/deleteProduct/${product_id}`);
        console.log(data);
        alert(data?.message)
        //refresh page
        window.location.reload();



    }
    
    const updateProduct = async (product_id) => {
        const product_name = prompt("Enter product name");
        console.log(product_name)
        const product_description = prompt("Enter product description");
        const category = prompt("Enter category");
        const quantity = prompt("Enter quantity");
        const price = prompt("Enter price");
        const supplier_id = 6
        const {data} = await baseInstance.put(`/products/updateProduct/${product_id}`, {
            product_id,
            product_name,
            product_description,
            category,
            quantity,
            price,
            supplier_id
        });
        console.log(data);
        alert(data?.message)
        //refresh page
        window.location.reload();

    }
  return (
    <div id="products">
         <table class="headingtop">
        <tr class="heading1">
          <th>Product description</th>
          <th>Product Category</th>
          <th>Quantity</th>
          <th>Name</th>
          <th>Price</th>
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
              <button  className="bt1"
              onClick={() => deleteProduct(val.product_id)}>
                Delete
                </button>
              <button className="bt1"
              onClick={() => updateProduct(val.product_id)}>
                Update
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

export default ShowProducts;