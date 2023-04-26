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
    <div>
        
    {showOrderHistory.map((val,key) => {
    
return(
            <div key={key}>
                <p>{val.product_name}</p>
                <p>{val.price}</p>
                <p>{val.quantity}</p>
                <p>{val.order_id}</p>
                <p>{val.order_date}</p>
                <hr/>
            </div>
        )
    })}

    </div>
  )
}

export default ShowOrderHistory