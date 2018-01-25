var allInvoiceItems = ["GET /api/v1/invoice_items", [
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
]];


$("#all-invoice-items").click(function() {
  $("#search-params").html("")
  $("#example-request").html(allInvoiceItems[0])
  $("#example-output").html(JSON.stringify(allInvoiceItems[1], undefined, 2))
});


var oneInvoiceItem = ["GET /api/v1/invoice_items/:id", {
  "id": 2,
  "item_id": 528,
  "invoice_id": 1,
  "quantity": 9,
  "unit_price": "233.24"
}];

var searchManyInvoiceItems = ["GET /api/v1/invoice_items/find_all?parameter", [
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
]];

var searchOneInvoiceItem = ["GET /api/v1/invoice_items/find?parameter", {
  "id": 135,
  "item_id": 1,
  "invoice_id": 29,
  "quantity": 2,
  "unit_price": "751.07"
}];
