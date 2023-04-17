import React, { useEffect, useState } from 'react'
import { baseInstance } from '../AxiosInstance';
import './App.css';

const Showorders = () => {
    const [order, setShoworders] = useState();
    useEffect(() => {
        const getorder = async () => {
            const {data} = await baseInstance.get('/order/getOrders');
    
            setShoworders(data.data.value);
            console.log(data)
        }
        getorder();
    }, [])
  return (
    <div>
         <table>
        <tr>
          <th>OrderName</th>
          <th>Price</th>
          <th>DeliveryTime</th>
          <th>CustomerAdd</th>
        </tr>
        {order && order.map((val, key) => {
          return (
            <tr key={key}>
              <td>{val.OrderName}</td>
              <td>{val.Price}</td>
              <td>{val.DeliveryTimeDays}</td>
              <td>{val.CustomerAdd}</td>
              <hr />
              <button  className='bt'>Delete</button>
              <a href='order'>
              <button class="bt">
               Update
              </button>
               </a>
            </tr>
          )
        })}
      </table>
    </div>
  )
}

export default Showorders;