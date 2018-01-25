var allInvoices = ["GET /api/vi/invocies", [
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

$("#all-invoices").click(function() {
  $("#search-params").html("")
  $("#example-request").html(allInvoices[0])
  $("#example-output").html(JSON.stringify(allInvoices[1], undefined, 2))
});

var oneInvoice = ["GET /api/vi/invocies/:id", {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}];

$("#one-invoice").click(function() {
  $("#search-params").html("")
  $("#example-request").html(oneInvoice[0])
  $("#example-output").html(JSON.stringify(oneInvoice[1], undefined, 2))
});

var invoiceSearchParams = `
<table>
  <th>Search Field</th>
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

var searchAllInvoices = ["GET /api/vi/invocies/find_all?parmeter", [
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

$("#search-many-invoices").click(function() {
  $("#search-params").html(invoiceSearchParams)
  $("#example-request").html(searchAllInvoices[0])
  $("#example-output").html(JSON.stringify(searchAllInvoices[1], undefined, 2))
});

var searchOneInvoice = ["GET /api/vi/invocies/find?parmeter", {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}];

$("#search-one-invoice").click(function() {
  $("#search-params").html(invoiceSearchParams)
  $("#example-request").html(searchOneInvoice[0])
  $("#example-output").html(JSON.stringify(searchOneInvoice[1], undefined, 2))
});
