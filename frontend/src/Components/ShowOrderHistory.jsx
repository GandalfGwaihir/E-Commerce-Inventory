import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { baseInstance } from '../AxiosInstance'

const ShowOrderHistory = () => {


    //fetch the slug id from url
    const [showOrderHistory,setShowOrderHistory] = useState([]);

    const {email} = useParams();

    console.log(email);


    useEffect(() => {
        const getOrders = async () => {
            const {data} = await baseInstance.post(`/customers/getProducts`,
            {
                email_id:email,
            }
            
            );
            setShowOrderHistory(data);
            console.log(data);}
            getOrders();
            console.log(showOrderHistory);

    },[]);



  return (
    <div > 
      <table class="headingtop">
        <tr class="heading1">
          <th>Product Name</th>
          <th>Price</th>
          <th>Description</th>
         
        </tr>
        
    {showOrderHistory.map((val,key) => {
    
return(
            <tr key={key}>
                <td>{val.product_name}</td>
                <td>{val.price}</td>
                <td>{val.product_description}</td>
                
                <hr/>
            </tr>
        );
    })}

    </table>
    </div>
  );
};

export default ShowOrderHistory