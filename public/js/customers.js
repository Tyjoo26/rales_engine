var allCustomers = ["GET /api/v1/customers", [
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

$("#all-customers").click(function() {
  $("#search-params").html("")
  $("#example-request").html(allCustomers[0])
  $("#example-output").html(JSON.stringify(allCustomers[1], undefined, 2))
});

var oneCustomer = ["GET /api/v1/customers/:id", {
  "id": 5,
  "first_name": "Sylvester",
  "last_name": "Nader"
}];

$("#one-customer").click(function() {
  $("#search-params").html("")
  $("#example-request").html(oneCustomer[0])
  $("#example-output").html(JSON.stringify(oneCustomer[1], undefined, 2))
});

var customerSearchParams = `
<table>
  <th>Search Field</th>
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

var searchAllCustomers = ["GET /api/v1/customers/find_all?parameter", [
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

$("#search-many-customers").click(function() {
  $("#search-params").html(customerSearchParams)
  $("#example-request").html(searchAllCustomers[0])
  $("#example-output").html(JSON.stringify(searchAllCustomers[1], undefined, 2))
});

var searchOneCustomer = ["GET /api/v1/customers/find?parameter", {
  "id": 3,
  "first_name": "Mariah",
  "last_name": "Toy"
}];

$("#search-one-customer").click(function() {
  $("#search-params").html(customerSearchParams)
  $("#example-request").html(searchOneCustomer[0])
  $("#example-output").html(JSON.stringify(searchOneCustomer[1], undefined, 2))
});
