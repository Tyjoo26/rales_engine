var topMerchantsRevenue = ["GET /api/v1/merchants/most_revenue?quantity=x (returns X merchants)", [
  {
    "id": 14,
    "name": "Dicki-Bednar"
  },
  {
    "id": 89,
    "name": "Kassulke, O'Hara and Quitzon"
  }
]];

$("#top-merchants-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topMerchantsRevenue[0])
  $("#example-output").html(JSON.stringify(topMerchantsRevenue[1], undefined, 2))
});

var topMerchantsItems = ["GET /api/v1/merchants/most_items?quantity=x (returns X merchants)", {
  "example": "example"
}];

$("#top-merchants-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topMerchantsItems[0])
  $("#example-output").html(JSON.stringify(topMerchantsItems[1], undefined, 2))
});

var merchantsTotalRevenue = ["GET /api/v1/merchants/revenue?date=x (date format: YYYY-MM-DD)", {
  "total_revenue": "2495397.37"
}];

$("#merchants-total-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantsTotalRevenue[0])
  $("#example-output").html(JSON.stringify(merchantsTotalRevenue[1], undefined, 2))
});

var merchantTotalRevenue = ["GET /api/v1/merchants/:id/revenue", {
  "id": 3,
  "total_revenue": "120.00"
}];

$("#merchant-total-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantTotalRevenue[0])
  $("#example-output").html(JSON.stringify(merchantTotalRevenue[1], undefined, 2))
});

var merchantTotalRevenueDate = ["GET /api/v1/merchants/:id/revenue?date=x (date format: YYYY-MM-DD)", {
  "id": 3,
  "total_revenue": "120.00"
}];

$("#merchant-total-revenue-date").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantTotalRevenueDate[0])
  $("#example-output").html(JSON.stringify(merchantTotalRevenueDate[1], undefined, 2))
});

var merchantFavoriteCustomer = ["GET /api/v1/merchants/:id/favorite_customer", {
  "id": 988,
  "first_name": "Efren",
  "last_name": "Smith"
}];

$("#merchant-total-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantTotalRevenue[0])
  $("#example-output").html(JSON.stringify(merchantTotalRevenue[1], undefined, 2))
});

var merchantCustomersPending = ["GET /api/v1/merchants/:id/customers_with_pending_invoices", {
  
}];
var topItemsRevenue = [
  {
    "id": 227,
    "name": "Item Dicta Autem",
    "description": "Fugiat est ut eum impedit vel et. Deleniti quia debitis similique. Sint atque explicabo similique est. Iste fugit quis voluptas. Rerum ut harum sed fugiat eveniet ullam ut.",
    "unit_price": "853.19",
    "merchant_id": 14
  },
  {
    "id": 2174,
    "name": "Item Nam Magnam",
    "description": "Eligendi quibusdam eveniet temporibus sed ratione ut magnam. Sit alias et. Laborum dignissimos quos impedit excepturi molestiae.",
    "unit_price": "788.08",
    "merchant_id": 89
  }
];

var topItemsItems = {};
var itemBestDay = {};
var customerFavoriteMerchant = {};
