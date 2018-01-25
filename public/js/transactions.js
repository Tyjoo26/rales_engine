var allTransactions = ["GET /api/v1/transactions", [
  {
    "id": 1,
    "credit_card_number": "4654405418249632",
    "invoice_id": 1,
    "result": "success"
  },
  {
    "id": 2,
    "credit_card_number": "4580251236515201",
    "invoice_id": 2,
    "result": "success"
  }
]];

$("#all-transactions").click(function() {
  $("#search-params").html("")
  $("#example-request").html(allTransactions[0])
  $("#example-output").html(JSON.stringify(allTransactions[1], undefined, 2))
});

var oneTransaction = ["GET /api/v1/transactions/:id", {
  "id": 4,
  "credit_card_number": "4515551623735607",
  "invoice_id": 5,
  "result": "success"
}];

$("#one-transaction").click(function() {
  $("#search-params").html("")
  $("#example-request").html(oneTransaction[0])
  $("#example-output").html(JSON.stringify(oneTransaction[1], undefined, 2))
});

var transactionSearchParams = `
<table>
  <th>Search Field</th>
  <th>Example Parameter</th>
  <tr>
    <td>transaction id</td>
    <td>id=27</td>
  </tr>
  <tr>
    <td>invoice id</td>
    <td>invoice_id=34</td>
  </tr>
  <tr>
    <td>result</td>
    <td>result=success or result=failed</td>
  </tr>
  <tr>
    <td>credit card number</td>
    <td>credit_card_number=4515551623735607</td>
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

var searchAllTransactions = ["GET /api/v1/transactions/find?parameter", [
  {
    "id": 1,
    "credit_card_number": "4654405418249632",
    "invoice_id": 1,
    "result": "success"
  },
  {
    "id": 2,
    "credit_card_number": "4580251236515201",
    "invoice_id": 2,
    "result": "success"
  }
]];

$("#search-many-transactions").click(function() {
  $("#search-params").html(transactionSearchParams)
  $("#example-request").html(searchAllTransactions[0])
  $("#example-output").html(JSON.stringify(searchAllTransactions[1], undefined, 2))
});

var searchOneTransaction = ["GET /api/v1/transactions/find?parameter", {
  "id": 4,
  "credit_card_number": "4515551623735607",
  "invoice_id": 5,
  "result": "success"
}];

$("#search-one-transaction").click(function() {
  $("#search-params").html(transactionSearchParams)
  $("#example-request").html(searchOneTransaction[0])
  $("#example-output").html(JSON.stringify(searchOneTransaction[1], undefined, 2))
});

var transactionInvoice = ["GET /api/v1/transactions/:id/invoice", {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}];

$("#transaction-invoice").click(function() {
  $("#search-params").html("")
  $("#example-request").html(transactionInvoice[0])
  $("#example-output").html(JSON.stringify(transactionInvoice[1], undefined, 2))
});
