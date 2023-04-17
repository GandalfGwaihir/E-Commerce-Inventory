import React from "react";
import { useState } from 'react';
import { baseInstance } from "../AxiosInstance";

function MyForm() {
  const [inputs, setInputs] = useState({});

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs(values => ({...values, [name]: value}))
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    const {data} = await baseInstance.post('/customer/addCustomer', inputs)
    console.log(inputs)
    console.log(data);
  }

  return (
    <div className="flex">
    <form onSubmit={handleSubmit}>
      <label className="First">Enter your first name:
      <input className="second"
        type="text" 
        name="first_name" 
        value={inputs.first_name || ""} 
        onChange={handleChange}
      />
      </label>
      <label className="First">Enter your Last name:
      <input className="second"
        type="text" 
        name="last_name" 
        value={inputs.Last_name || ""} 
        onChange={handleChange}
      /> </label>
      <label className="First">Enter City Name:
      <input className="second"
        type="text" 
        name="city" 
        value={inputs.Cityname || ""} 
        onChange={handleChange}
      />
      </label>
      <label className="First">Enter State Name:
      <input className="second"
        type="text" 
        name="state" 
        value={inputs.state || ""} 
        onChange={handleChange}
      />
      </label>
      <label className="First">Enter Country Name:
      <input className="second"
        type="text" 
        name="country" 
        value={inputs.Country || ""} 
        onChange={handleChange}
      />
      </label>
      <label className="First">Enter Mobile number:
        <input className="second"
          type="number" 
          name="phone_no" 
          value={inputs.phone_no || ""} 
          onChange={handleChange}
        />
         </label>
         <label className="First">Enter email id:
      <input className="second"
        type="text" 
        name="email_id" 
        value={inputs.email_id || ""} 
        onChange={handleChange}
      />
      </label>
        <input className="button" type="submit" />
    </form>
    </div>
  )
}

export default MyForm;