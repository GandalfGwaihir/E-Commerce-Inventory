export const ProductQueries = {
    GetProducts: `
        SELECT * FROM product
    `,
    GetProduct: `
        call \`getProduct\`(?, ?);
    `,
    GetProductById: `
        SELECT * FROM customer
            JOIN names
            ON customer.customer_id = names.name_id
            JOIN addresses
            ON customer.customer_id = addresses.address_id
        WHERE customer.customer_id = ?
    `,
    InsertProduct: `
        call \`insertProduct\`(?, ?, ?, ?, ?, ?, ?);
    `,

    UpdateProduct: `
        call \`updateProduct\`(?, ?, ?, ?, ?, ?, ?);
    `,

    DeleteProduct: `
        DELETE FROM product WHERE product_id = ?;
    `,
    BuyProduct: `
        CALL \`buyProduct\`(?, ?);
    `,
    GetEmailByProduct:`
        CALL \`getEmailByProductId\`(?);
    `
} 
