export const CustomerQueries = {
    GetCustomers: `
        SELECT * FROM customer
            JOIN names
            ON customer.customer_id = names.name_id
            JOIN addresses
            ON customer.customer_id = addresses.address_id
    `,
    GetCustomersWithBounds: `
        call \`getCustomersWithBounds\`(?, ?);
    `,
    GetCustomerById: `
        SELECT * FROM customer
            JOIN names
            ON customer.customer_id = names.name_id
            JOIN addresses
            ON customer.customer_id = addresses.address_id
        WHERE customer.customer_id = ?
    `,
    InsertCustomer: `
        call \`insertCustomer\`(?, ?, ?, ?, ?, ?, ?, ?, ?);
    `,
    UpdateCustomer: `
        call \`updateCustomer\`(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `,
    DeleteCustomer: `
        DELETE FROM customer WHERE customer_id = ?;
    `
}
