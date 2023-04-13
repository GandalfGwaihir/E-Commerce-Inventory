export const OrderQueries = {
    InsertOrder: `
        call insertOrder(?, ?, ?, ?, ?, ?);
    `,
    GetOrders: `
        SELECT * FROM Order1;
    `
}