import React from "react";
import { useState } from "react";

function Updatedorder() {
  const [inputs, setInputs] = useState({});

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs((values) => ({ ...values, [name]: value }));
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log(inputs);
  };

  return (
    <>
      <div className="flex">
        <form onSubmit={handleSubmit}>
          <label className="First">
           Update customer_id:
            <input
              className="second"
              type="number"
              name="customerid"
              value={inputs.customerid || ""}
              onChange={handleChange}
            />
          </label>
          <label className="First">
            Update Order Name:
            <input
              className="second"
              type="text"
              name="OrderName"
              value={inputs.OrderName || ""}
              onChange={handleChange}
            />
          </label>
          <label className="First">
            Update Price:
            <input
              className="second"
              type="number"
              name="Price"
              value={inputs.Price || ""}
              onChange={handleChange}
            />
          </label>
          <label className="First">
            Update Deliver Time:
            <input
              className="second"
              type="number"
              name="DeliveryTimeDays"
              value={inputs.DeliveryTimeDays || ""}
              onChange={handleChange}
            />
          </label>
          <label className="First">
           Update Customer Address:
            <input
              className="second"
              type="text"
              name="CustomerAdd"
              value={inputs.CustomerAdd || ""}
              onChange={handleChange}
            />
          </label>
          <input className="button" type="submit" />
        </form>
      </div>
    </>
  );
}

export default Updatedorder;
