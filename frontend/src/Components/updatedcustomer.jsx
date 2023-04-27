import React from "react";
import { useState } from "react";
import { baseInstance } from "../AxiosInstance";
import { useParams } from "react-router-dom";

function Updatedcustomer() {
  const [inputs, setInputs] = useState({});
  const {id} = useParams();
  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs((values) => ({ ...values, [name]: value }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    inputs["customer_id"] = id;
    const { data } = await baseInstance.put(`/customers/updateCustomer/${id}`, inputs);
    if (data.affectedRows > 0) {
      alert("Customer updated successfully")
      window.location.href('/')
    }    
  };

  return (
    <div className="flex">
      <form onSubmit={handleSubmit}>
        <label className="First">
          Update first name:
          <input
            className="second"
            type="text"
            name="first_name"
            value={inputs.first_name || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Last name:
          <input
            className="second"
            type="text"
            name="last_name"
            value={inputs.last_name || ""}
            onChange={handleChange}
          />{" "}
        </label>
        <label className="First">
          Update City Name:
          <input
            className="second"
            type="text"
            name="city"
            value={inputs.city || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update State Name:
          <input
            className="second"
            type="text"
            name="state"
            value={inputs.state || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Country Name:
          <input
            className="second"
            type="text"
            name="country"
            value={inputs.country || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update Mobile number:
          <input
            className="second"
            type="number"
            name="phone_no"
            value={inputs.phone_no || ""}
            onChange={handleChange}
          />
        </label>
        <label className="First">
          Update email id:
          <input
            className="second"
            type="text"
            name="email_id"
            value={inputs.email_id || ""}
            onChange={handleChange}
          />
        </label>
        <input className="button" type="submit" />
      </form>
    </div>
  );
}

export default Updatedcustomer;
