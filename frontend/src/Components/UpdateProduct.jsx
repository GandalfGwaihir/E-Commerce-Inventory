import React from "react";
import { useState } from "react";
import { baseInstance } from "../AxiosInstance";
import { useParams } from 'react-router-dom'

function UpdateProduct() {
  const [inputs, setInputs] = useState({});
  const product_id = useParams()


  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs((values) => ({ ...values, [name]: value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    inputs['supplier_id'] = 5;
    const { data } = await baseInstance.put(`/products/updateProduct/${product_id}`, inputs);
    if(data.product_name){
    alert("Product Added Successfully")
    //redirect to main page
    window.location.href = "/";
    }else{
      alert("Enter Correct Details")
    }
    
  };
  
  return (
    <div className="flex">
      <form onSubmit={handleSubmit}>
        <label className="First">
          Update Product description:
          <input
            className="second"
            type="text"
            name="product_description"
            value={inputs.product_description || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
         Update Product category:
          <input
            className="second"
            type="text"
            name="category"
            value={inputs.category || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Product Quantity:
          <input
            className="second"
            type="number"
            name="quantity"
            value={inputs.quantity || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Product Name:
          <input
            className="second"
            type="text"
            name="product_name"
            value={inputs.product_name || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Product price:
          <input
            className="second"
            type="text"
            name="price"
            value={inputs.price || ""}
            onChange={handleChange}
          />
        </label>
        <input className="button" type="submit" />
      </form>
    </div>
  );
}

export default UpdateProduct;
