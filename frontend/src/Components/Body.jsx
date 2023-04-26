import React from "react";
import Customers from "./Customers";
import Showorders from "./showorders";
import Showpayments from "./showpayments";

function Body() {
  return (
    <body>
      <a href="#customers">See customers</a>
      <br />
      <a href="#orders">See orders</a>
      <br />
      <a href="#products">See products</a>
      <br />
      <h1 className="Title2">Customer details</h1>
      <Customers />
      <h1 className="Title2"> SHOW ORDER DETAILS</h1>
      <Showorders />
      <h1 className="Title2">Show Payment Details</h1>
      <Showpayments />
    </body>
  );
}
export default Body;
