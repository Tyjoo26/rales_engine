var allInvoiceItems = [
  "",
  "GET /api/v1/invoice_items", [
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
]];

var oneInvoiceItem = [
  "",
  "GET /api/v1/invoice_items/:id", {
  "id": 2,
  "item_id": 528,
  "invoice_id": 1,
  "quantity": 9,
  "unit_price": "233.24"
}];

var invoiceItemSearchParams = `
<h3>Search Details</h3>
<table>
  <th>Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>invoice item id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>item id</td>
    <td>item_id=54</td>
  </tr>
  <tr>
    <td>invoice id</td>
    <td>invoice_id=43</td>
  </tr>
  <tr>
    <td>quantity</td>
    <td>quantity=5</td>
  </tr>
  <tr>
    <td>unit_price</td>
    <td>unit_price=19.99</td>
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

var searchManyInvoiceItems = [
  invoiceItemSearchParams,
  "GET /api/v1/invoice_items/find_all?parameter", [
  {
    "id": 135,
    "item_id": 1,
    "invoice_id": 29,
    "quantity": 2,
    "unit_price": "751.07"
  },
  {
    "id": 645,
    "item_id": 1,
    "invoice_id": 137,
    "quantity": 7,
    "unit_price": "751.07"
  }
]];

var searchOneInvoiceItem = [
  "",
  "GET /api/v1/invoice_items/find?parameter", {
  "id": 135,
  "item_id": 1,
  "invoice_id": 29,
  "quantity": 2,
  "unit_price": "751.07"
}];

var invoiceItemsInvoice = [
  "",
  "GET /api/v1/invoice_items/:id/invoice",
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
]

var invoiceItemsItem = [
  "",
  "GET /api/v1/invoice_items/:id/item",
{
  "id": 2,
  "name": "Item Autem Minima",
  "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
  "unit_price": "670.76",
  "merchant_id": 1
}
]
