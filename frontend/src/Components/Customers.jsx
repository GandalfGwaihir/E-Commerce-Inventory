import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';

const Customers = () => {
    const [customers, setCustomers] = useState();
    useEffect(() => {
        const getCust = async () => {
            const {data} = await baseInstance.get('/customer/getCustomers');
            setCustomers(data);
            console.log(data)
        }
        getCust();
    }, [])
  return (
    <div>
         <table>
        <tr>
          <th>Name</th>
          <th>Age</th>
          <th>Gender</th>
        </tr>
        {customers && customers.map((val, key) => {
          return (
            <tr key={key}>
              <td>{val.first_name}</td>
              <td>{val.last_name}</td>
              <td>{val.city}</td>
            </tr>
          )
        })}
      </table>
        {customers && 
            customers.map((customer) => {
                return (
                    <div>
                        {customer?.first_name}
                        {customer?.last_name}
                        {customer?.city}
                    </div>
                )
            })
        }
    </div>
  )
}

export default Customers