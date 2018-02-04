var topMerchantsRevenue = [
  "",
  "GET /api/v1/merchants/most_revenue?quantity=x <br>(returns X merchants)", [
  {
    "id": 14,
    "name": "Dicki-Bednar"
  },
  {
    "id": 89,
    "name": "Kassulke, O'Hara and Quitzon"
  }
]]

var topMerchantsItems = [
  "",
  "GET /api/v1/merchants/most_items?quantity=x <br>(returns X merchants)",
[{
  "id":89,
  "name":"Kassulke, O'Hara and Quitzon"
}]];

var merchantsTotalRevenue = [
  "",
  "GET /api/v1/merchants/revenue?date=x <br>(date format: YYYY-MM-DD)", {
  "total_revenue": "2495397.37"
}]

var merchantTotalRevenue = [
  "",
  "GET /api/v1/merchants/:id/revenue", {
  "id": 3,
  "total_revenue": "25604.00"
}]

var merchantTotalRevenueDate = [
  "",
  "GET /api/v1/merchants/:id/revenue?date=x <br>(date format: YYYY-MM-DD)", {
  "id": 3,
  "total_revenue": "120.00"
}]

var merchantFavoriteCustomer = [
  "",
  "GET /api/v1/merchants/:id/favorite_customer", {
  "id": 988,
  "first_name": "Efren",
  "last_name": "Smith"
}]

var merchantCustomersPending = [
  "",
  "GET /api/v1/merchants/:id/customers_with_pending_invoices", [
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

var topItemsRevenue = [
  "",
  "GET /api/v1/items/most_revenue?quantity=x <br>(returns X items)",
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

var topItemsQuantity = [
  "",
  "GET /api/v1/items/most_items?quantity=x <br>(returns X items)", [
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

var itemBestDay = [
  "",
  "GET /api/v1/items/:id/best_day", {
  "best_day": "2012-03-22T03:55:09.000Z"
}]

var customerFavoriteMerchant = [
  "",
  "GET /api/v1/customers/:id/favorite_merchant",
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}]
