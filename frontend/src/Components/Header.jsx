import React from "react";


function Header() {
      return <header>
        <div className="flex-items">
        <h1>Inventory Management</h1>
        <a className="flex-items flex-items2" href="/login">Enter Customer details</a>
        {/* <a className="flex-items flex-items2" href="/Order">Enter Order details</a> */}
        {/* <a className="flex-items flex-items2" href="/Payment">Enter Payment details</a> */}
        <a className="flex-items flex-items2" href="/Product">Enter Product details</a>

        </div>
      </header>
}

export default Header;