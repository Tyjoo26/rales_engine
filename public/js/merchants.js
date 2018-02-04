var allMerchants = [
  "",
  "GET /api/v1/merchants",[
  {
    "id": 1,
    "name": "Schroeder-Jerde"
  },
  {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]];

var oneMerchant = [
  "",
  "GET /api/v1/merchants/:id" ,
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}];


var merchantSearchParams = `
<h3>Search Details</h3>
<table>
  <th>Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>merchant id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>name</td>
    <td>name=Merchant</td>
  </tr>
  <tr>
    <td>created at</td>
    <td>created_at="2012-03-27T14:56:04.000Z"</td>
  </tr>
  <tr>
    <td>updated at</td>
    <td>updated_at="2012-03-27T14:56:04.000Z"</td>
  </tr>
</table>
`

var searchManyMerchants = [
  merchantSearchParams,
  "GET /api/vi/merchants/find_all?parameter",
  [{
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]];

var searchOneMerchant = [
  merchantSearchParams,
  "GET /api/vi/merchants/find?parameter",
  {
  "id": 2,
  "name": "Klein, Rempel and Jones"
}];

var merchantItems = [
  "",
  "GET /api/v1/merchants/:id/items",
  [{
    "id": 53,
    "name": "Item Sunt Nesciunt",
    "description": "Magni eos cupiditate animi. Ea consequatur saepe quo earum. In magni dolorem maxime tempora. Inventore iure ad delectus quo neque voluptates. Optio repellat occaecati.",
    "unit_price": "711.98",
    "merchant_id": 2
  },
  {
    "id": 52,
    "name": "Item Sit Facere",
    "description": "Vero libero laboriosam qui expedita dignissimos. Deserunt aliquam et aut accusamus aut iure natus. Qui eveniet quidem. Et praesentium quos doloremque quidem aut ab. Eius doloribus aut nisi.",
    "unit_price": "856.42",
    "merchant_id": 2
  }
]];

var merchantInvoices = [
  "",
  "GET /api/v1/merchants/:id/invoices", [
  {
    "id": 45,
    "customer_id": 10,
    "merchant_id": 2,
    "status": "shipped"
  },
  {
    "id": 77,
    "customer_id": 16,
    "merchant_id": 2,
    "status": "shipped"
  }
]]
