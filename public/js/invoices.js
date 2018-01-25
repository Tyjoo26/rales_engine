var allInvoices = ["GET /api/v1/invocies", [
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

var oneInvoice = ["GET /api/v1/invocies/:id", {
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

var searchAllInvoices = ["GET /api/v1/invocies/find_all?parmeter", [
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

var searchOneInvoice = ["GET /api/v1/invocies/find?parmeter", {
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

var invoiceTransactions = ["GET /api/v1/invoices/:id/transactions", [
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
    "result": "success"
  }
]]

$("#invoice-transactons").click(function() {
  $("#search-params").html("")
  $("#example-request").html(invoiceTransactions[0])
  $("#example-output").html(JSON.stringify(invoiceTransactions[1], undefined, 2))
});

var invoiceInvoiceItems = ["GET /api/v1/invoices/:id/invoice_items", [
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

$("#invoice-invoice-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(invoiceInvoiceItems[0])
  $("#example-output").html(JSON.stringify(invoiceInvoiceItems[1], undefined, 2))
});

var invoiceItems = ["GET /api/v1/invoices/:id/items", [
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

$("#invoice-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(invoiceItems[0])
  $("#example-output").html(JSON.stringify(invoiceItems[1], undefined, 2))
});

var invoiceCustomer = ["GET /api/v1/invoices/:id/customer", {
  "id": 5,
  "first_name": "Sylvester",
  "last_name": "Nader"
}]

$("#invoice-customer").click(function() {
  $("#search-params").html("")
  $("#example-request").html(invoiceCustomer[0])
  $("#example-output").html(JSON.stringify(invoiceCustomer[1], undefined, 2))
});

var invoiceMerchant = ["GET /api/v1/invoices/:id/merchant", {
  "id": 2,
  "name": "Klein, Rempel and Jones"
}]
