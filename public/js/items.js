var allItems = [
  "",
  "GET /api/v1/items",
  [{
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
]];

var oneItem = [
  "",
  "GET /api/v1/items/:id",
  {
  "id": 2,
  "name": "Item Autem Minima",
  "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
  "unit_price": "670.76",
  "merchant_id": 1
}];

var itemSearchParams = `
<h3>Search Details</h3>
<table>
  <th>Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>item id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>name</td>
    <td>name=Item Explicabo Ipsam</td>
  </tr>
  <tr>
    <td>description</td>
    <td>description=facilis</td>
  </tr>
  <tr>
    <td>unit_price</td>
    <td>unit_price=19.99</td>
  </tr>
  <tr>
    <td>merchant id</td>
    <td>merchant_id=54</td>
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

var searchManyItems = [
  itemSearchParams,
  "GET /api/v1/items/find_all?parameter", [
  {
    "id": 201,
    "name": "Item Explicabo Ipsam",
    "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
    "unit_price": "774.09",
    "merchant_id": 10
  },
  {
    "id": 202,
    "name": "Item Molestias Molestiae",
    "description": "Doloremque qui recusandae modi unde. Vitae consequatur commodi recusandae sunt occaecati et. Autem vel sit quos voluptatem excepturi.",
    "unit_price": "814.97",
    "merchant_id": 10
  }
]];

var searchOneItem = [
  itemSearchParams,
  "GET /api/v1/items/find?parameter", {
  "id": 201,
  "name": "Item Explicabo Ipsam",
  "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
  "unit_price": "774.09",
  "merchant_id": 10
}];

var itemInvoiceItems = [
  "",
  "GET /api/v1/items/:id/invoice_items",
[
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
]]

var itemMerchant = [
  "",
  "GET /api/v1/items/:id/merchant",
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}]
