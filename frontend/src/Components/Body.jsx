import React from "react";
import Customers from "./Customers";
import Showorders from "./showorders";

function Body(){
 return( 
 <body >
  <h1 className="Title2">Customer details</h1>
 <Customers/>
 <h1 className="Title2"> SHOW ORDER DETAILS</h1>
 <Showorders />
  </body>
 );
 
}
export default Body;