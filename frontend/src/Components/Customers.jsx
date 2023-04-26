import React, { useEffect, useState } from "react";
import { baseInstance } from "../AxiosInstance";
import "./App.css";

const Customers = () => {
  const [customers, setCustomers] = useState();
  useEffect(() => {
    const getCust = async () => {
      const { data } = await baseInstance.get("/customer/getCustomers");
      setCustomers(data.data.value);
      console.log(data);
    };
    getCust();
  }, []);

  const deleteCust = async (id) => {
    const res = window.confirm(
      "Are you sure you want to delete this customer?"
    );
    if (!res) {
      return;
    }
    const { data, error } = await baseInstance.delete(
      `/customer/deleteCustomer/${id}`
    );
    if (error) {
      console.log(error);
      return;
    }
    alert("Customer deleted successfully");
    window.location.reload();
    console.log(data);
    return;
  };

  return (
    <div>
      <table className="headingtop">
        <tr class="heading1">
          <th>FirstNmae</th>
          <th>LastName</th>
          <th>City</th>
          <th>State</th>
          <th>Email-id</th>
        </tr>
        {customers &&
          customers.map((val, key) => {
            return (
              <tr  key={key}>
                <td>{val.first_name}</td>
                <td>{val.last_name}</td>
                <td>{val.city}</td>
                <td>{val.state}</td>
                <td>{val.email_id}</td>
                <hr />
                <button
                  className="bt"
                  onClick={() => deleteCust(val.customer_id)}
                >
                  Delete
                </button>
                <a href="updatedcust">
                  <button class="bt">Update</button>
                </a>
              </tr>
            );
          })}
      </table>
    </div>
  );
};

export default Customers;
