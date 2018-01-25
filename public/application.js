$.getScript("js/merchants.js", function() {});
$.getScript("js/transactions.js", function() {});
$.getScript("js/customers.js", function() {});




var allInvoices = [
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
];

var oneInvoices = {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
};

var searchAllInvoices = [
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
];

var searchOneInvoice = {
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
};

var allItems = [
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
];

var oneItem = {
  "id": 2,
  "name": "Item Autem Minima",
  "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
  "unit_price": "670.76",
  "merchant_id": 1
};

var searchManyItems = [
  {
    "id": 201,
    "name": "Item Explicabo Ipsam",
    "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
    "unit_price": "774.09",
    "merchant_id": 10
  },
  {
    "id": 202,
    "name": "Item Molestias Molestiae",
    "description": "Doloremque qui recusandae modi unde. Vitae consequatur commodi recusandae sunt occaecati et. Autem vel sit quos voluptatem excepturi.",
    "unit_price": "814.97",
    "merchant_id": 10
  }
];

var searchOneItem = {
  "id": 201,
  "name": "Item Explicabo Ipsam",
  "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
  "unit_price": "774.09",
  "merchant_id": 10
};

var allInvoiceItems = [
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
];

var oneInvoiceItem = {
  "id": 2,
  "item_id": 528,
  "invoice_id": 1,
  "quantity": 9,
  "unit_price": "233.24"
};

var searchManyInvoiceItems = [
  {
    "id": 135,
    "item_id": 1,
    "invoice_id": 29,
    "quantity": 2,
    "unit_price": "751.07"
  },
  {
    "id": 645,
    "item_id": 1,
    "invoice_id": 137,
    "quantity": 7,
    "unit_price": "751.07"
  }
];

var searchOneInvoiceItem = {
  "id": 135,
  "item_id": 1,
  "invoice_id": 29,
  "quantity": 2,
  "unit_price": "751.07"
};

var topMerchantsRevenue = [
  {
    "id": 14,
    "name": "Dicki-Bednar"
  },
  {
    "id": 89,
    "name": "Kassulke, O'Hara and Quitzon"
  }
];

var topMerchantsItems = {
};

var merchantsTotalRevenue = {
  "total_revenue": "2495397.37"
};

var merchantTotalRevenue = {
  "id": 3,
  "total_revenue": "120.00"
};

var merchantTotalRevenueDate = {
};

var merchantFavoriteCustomer = {
  "id": 988,
  "first_name": "Efren",
  "last_name": "Smith"
};

var merchantCustomersPending = {};
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
