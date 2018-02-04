var allCustomers = [
  "",
  "GET /api/v1/customers", [
  {
    "id": 1,
    "first_name": "Joey",
    "last_name": "Ondricka"
  },
  {
    "id": 2,
    "first_name": "Cecelia",
    "last_name": "Osinski"
  }
]];


var oneCustomer = [
  "",
  "GET /api/v1/customers/:id", {
  "id": 5,
  "first_name": "Sylvester",
  "last_name": "Nader"
}];

var customerSearchParams = `
<h3>Search Details</h3>
<table>
  <th>Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>customer id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>first name</td>
    <td>first_name=Germaine</td>
  </tr>
  <tr>
    <td>last name</td>
    <td>last_name=Kirlin</td>
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

var searchManyCustomers = [
  customerSearchParams,
  "GET /api/v1/customers/find_all?parameter", [
  {
    "id": 477,
    "first_name": "Josefina",
    "last_name": "Yost"
  },
  {
    "id": 478,
    "first_name": "Mafalda",
    "last_name": "Labadie"
  }
]];

var searchOneCustomer = [
  customerSearchParams,
  "GET /api/v1/customers/find?parameter", {
  "id": 3,
  "first_name": "Mariah",
  "last_name": "Toy"
}];


var customerInvoices = [
  "",
  "GET /api/v1/customers/:id/invoices", [
  {
    "id": 13,
    "customer_id": 3,
    "merchant_id": 34,
    "status": "shipped"
  },
  {
    "id": 12,
    "customer_id": 3,
    "merchant_id": 8,
    "status": "shipped"
  }
]];

var customerTransactions = [
  "",
  "GET /api/v1/customers/:id/transactions", [
  {
    "id": 15,
    "credit_card_number": "4869639160798434",
    "invoice_id": 13,
    "result": "failed"
  },
  {
    "id": 13,
    "credit_card_number": "4536896898764278",
    "invoice_id": 12,
    "result": "success"
  }
]];
