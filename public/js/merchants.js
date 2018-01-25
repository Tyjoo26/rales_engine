var allMerchants = ["GET /api/v1/merchants",[
  {
    "id": 1,
    "name": "Schroeder-Jerde"
  },
  {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]];

$("#all-merchants").click(function() {
  $("#search-params").html("")
  $("#example-request").html(allMerchants[0])
  $("#example-output").html(JSON.stringify(allMerchants[1], undefined, 2))
});

var oneMerchant = ["GET /api/v1/merchants/:id" ,
  {
  "merchant": {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
}];

$("#one-merchant").click(function() {
  $("#search-params").html("")
  $("#example-request").html(oneMerchant[0])
  $("#example-output").html(JSON.stringify(oneMerchant[1], undefined, 2))
});

var merchantSearchParams = `
<table>
  <th>Search Field</th>
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

var searchAllMerchants = ["GET /api/vi/merchants/find?parameter", [
  {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]];

$("#search-many-merchants").click(function() {
  $("#search-params").html(merchantSearchParams)
  $("#example-request").html(searchAllMerchants[0])
  $("#example-output").html(JSON.stringify(searchAllMerchants[1], undefined, 2))
});

var searchOneMerchant = ["GET /api/vi/merchants/find_all?parameter", {
  "id": 2,
  "name": "Klein, Rempel and Jones"
}];

$("#search-one-merchant").click(function() {
  $("#search-params").html(merchantSearchParams)
  $("#example-request").html(searchOneMerchant[0])
  $("#example-output").html(JSON.stringify(searchOneMerchant[1], undefined, 2))
});

var merchantItems = ["GET /api/v1/merchants/:id/items", [
  {
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

$("#merchant-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantItems[0])
  $("#example-output").html(JSON.stringify(merchantItems[1], undefined, 2))
})

var merchantInvoices = ["GET /api/v1/merchants/:id/items", [
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

$("#merchant-invoices").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantInvoices[0])
  $("#example-output").html(JSON.stringify(merchantInvoices[1], undefined, 2))
})
