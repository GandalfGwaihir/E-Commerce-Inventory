import React from "react";
import Customers from "./Customers";
import Showorders from "./showorders";
import Showpayments from "./showpayments";

function Body(){
 return( 
 <body >
  <h1 className="Title2">Customer details</h1>
 <Customers/>
 <h1 className="Title2"> SHOW ORDER DETAILS</h1>
 <Showorders />
 <h1 className="Title2">Show Payment Details</h1>
 <Showpayments />
  </body>
 );
 
}
export default Body;