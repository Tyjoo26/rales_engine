var allInvoices = [
  "",
  "GET /api/v1/invoices", [
  {
    "id": 1,
    "customer_id": 1,
    "merchant_id": 26,
    "status": "shipped"
  },
  {
    "id": 2,
    "customer_id": 1,
    "merchant_id": 75,
    "status": "shipped"
  }
]];

var oneInvoice = [
  "",
  "GET /api/v1/invoices/:id", {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}];

var invoiceSearchParams = `
<h3>Search Details</h3>
<table>
  <th>Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>invoice id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>customer id</td>
    <td>customer_id=24</td>
  </tr>
  <tr>
    <td>merchant id</td>
    <td>merchant_id=34</td>
  </tr>
  <tr>
    <td>status</td>
    <td>status=shipped</td>
  </tr>
  <tr>
    <td>created at</td>
    <td>created_at="2012-03-27T14:56:04.000Z"</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>updated_at="2012-03-27T14:56:04.000Z"</td>
  </tr>
</table>
`

var searchManyInvoices = [
  invoiceSearchParams,
  "GET /api/v1/invoices/find_all?parmeter", [
  {
    "id": 20,
    "customer_id": 4,
    "merchant_id": 10,
    "status": "shipped"
  },
  {
    "id": 161,
    "customer_id": 31,
    "merchant_id": 10,
    "status": "shipped"
  }
]];

var searchOneInvoice = [
  invoiceSearchParams,
  "GET /api/v1/invoices/find?parmeter", {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}];


var invoiceTransactions = [
  "",
  "GET /api/v1/invoices/:id/transactions", [
  {
    "id": 1,
    "credit_card_number": "4654405418249632",
    "invoice_id": 1,
    "result": "success"
  },
  {
    "id": 2,
    "credit_card_number": "4580251236515201",
    "invoice_id": 1,
    "result": "failed"
  }
]]

var invoiceInvoiceItems = [
  "",
  "GET /api/v1/invoices/:id/invoice_items", [
  {
    "id": 1,
    "item_id": 539,
    "invoice_id": 1,
    "quantity": 5,
    "unit_price": "136.35"
  },
  {
    "id": 2,
    "item_id": 528,
    "invoice_id": 1,
    "quantity": 9,
    "unit_price": "233.24"
  }
]]

var invoiceItems = [
  "",
  "GET /api/v1/invoices/:id/items", [
  {
    "id": 1,
    "name": "Item Qui Esse",
    "description": "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
    "unit_price": "751.07",
    "merchant_id": 1
  },
  {
    "id": 2,
    "name": "Item Autem Minima",
    "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
    "unit_price": "670.76",
    "merchant_id": 1
  }
]]

var invoiceCustomer = [
  "",
  "GET /api/v1/invoices/:id/customer", {
  "id": 5,
  "first_name": "Sylvester",
  "last_name": "Nader"
}]

var invoiceMerchant = [
  "",
  "GET /api/v1/invoices/:id/merchant", {
  "id": 2,
  "name": "Klein, Rempel and Jones"
}]
