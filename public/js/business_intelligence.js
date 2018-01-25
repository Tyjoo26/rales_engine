var topMerchantsRevenue = ["GET /api/v1/merchants/most_revenue?quantity=x (returns X merchants)", [
  {
    "id": 14,
    "name": "Dicki-Bednar"
  },
  {
    "id": 89,
    "name": "Kassulke, O'Hara and Quitzon"
  }
]]

$("#top-merchants-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topMerchantsRevenue[0])
  $("#example-output").html(JSON.stringify(topMerchantsRevenue[1], undefined, 2))
})

var topMerchantsItems = ["GET /api/v1/merchants/most_items?quantity=x (returns X merchants)", {
  "example": "example"
}]

$("#top-merchants-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topMerchantsItems[0])
  $("#example-output").html(JSON.stringify(topMerchantsItems[1], undefined, 2))
})

var merchantsTotalRevenue = ["GET /api/v1/merchants/revenue?date=x (date format: YYYY-MM-DD)", {
  "total_revenue": "2495397.37"
}]

$("#merchants-total-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantsTotalRevenue[0])
  $("#example-output").html(JSON.stringify(merchantsTotalRevenue[1], undefined, 2))
})

var merchantTotalRevenue = ["GET /api/v1/merchants/:id/revenue", {
  "id": 3,
  "total_revenue": "25604.00"
}]

$("#merchant-total-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantTotalRevenue[0])
  $("#example-output").html(JSON.stringify(merchantTotalRevenue[1], undefined, 2))
})

var merchantTotalRevenueDate = ["GET /api/v1/merchants/:id/revenue?date=x (date format: YYYY-MM-DD)", {
  "id": 3,
  "total_revenue": "120.00"
}]

$("#merchant-total-revenue-date").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantTotalRevenueDate[0])
  $("#example-output").html(JSON.stringify(merchantTotalRevenueDate[1], undefined, 2))
})

var merchantFavoriteCustomer = ["GET /api/v1/merchants/:id/favorite_customer", {
  "id": 988,
  "first_name": "Efren",
  "last_name": "Smith"
}]

$("#merchant-favorite-customer").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantFavoriteCustomer[0])
  $("#example-output").html(JSON.stringify(merchantFavoriteCustomer[1], undefined, 2))
})

var merchantCustomersPending = ["GET /api/v1/merchants/:id/customers_with_pending_invoices", [
{
  "id": 28,
  "first_name": "Wilfred",
  "last_name": "Emmerich"
},
{
  "id": 197,
  "first_name": "Cara",
  "last_name": "Schultz"
}]]

$("#merchant-customers-pending").click(function() {
  $("#search-params").html("")
  $("#example-request").html(merchantCustomersPending[0])
  $("#example-output").html(JSON.stringify(merchantCustomersPending[1], undefined, 2))
})

var topItemsRevenue = ["GET /api/v1/items/most_revenue?quantity=x (returns X items)",
[
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
]]

$("#top-items-revenue").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topItemsRevenue[0])
  $("#example-output").html(JSON.stringify(topItemsRevenue[1], undefined, 2))
})

var topItemsQuantity = ["GET /api/v1/items/most_items?quantity=x", [
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
]]

$("#top-items-quantity").click(function() {
  $("#search-params").html("")
  $("#example-request").html(topItemsQuantity[0])
  $("#example-output").html(JSON.stringify(topItemsQuantity[1], undefined, 2))
})

var itemBestDay = ["GET /api/v1/items/:id/best_day", {
  "best_day": "2012-03-22T03:55:09.000Z"
}]

$("#item-best-day").click(function() {
  $("#search-params").html("")
  $("#example-request").html(itemBestDay[0])
  $("#example-output").html(JSON.stringify(itemBestDay[1], undefined, 2))
})

var customerFavoriteMerchant = ["GET /api/v1/customers/:id/favorite_merchant",
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}
]

$("#customer-favorite-merchant").click(function() {
  $("#search-params").html("")
  $("#example-request").html(customerFavoriteMerchant[0])
  $("#example-output").html(JSON.stringify(customerFavoriteMerchant[1], undefined, 2))
})
