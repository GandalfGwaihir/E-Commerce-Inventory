import React from "react";
import Customers from "./Customers";
import Showorders from "./showorders";
import Showpayments from "./showpayments";

function Body() {
  return (
    <body>
      <div className="mainhs">
      <button className="homescreen"><a href="#customers">See customers</a></button>
      <br />
      <button className="homescreen"><a href="#orders">See orders</a></button>
      <br />
      <button className="homescreen"><a href="#products">See products</a></button>
      <br />
      </div>
      <h1 className="Title2">Customer details</h1>
      <Customers />
      <h1 className="Title2"> SHOW ORDER DETAILS</h1>
      <Showorders />
      <h1 className="Title2">Show Product Details</h1>
      <Showpayments />
    </body>
  );
}
export default Body;
