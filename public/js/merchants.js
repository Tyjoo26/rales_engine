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
