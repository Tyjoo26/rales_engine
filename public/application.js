$.getScript("js/merchants.js", function() {});
$.getScript("js/transactions.js", function() {});
$.getScript("js/customers.js", function() {});
$.getScript("js/invoices.js", function() {});
$.getScript("js/items.js", function() {});
$.getScript("js/invoice_items.js", function() {});
$.getScript("js/business_intelligence.js", function() {});


$.fn.showResult = function(endpoint) {
  $("#search-params").html(endpoint[0]);
  $("#example-request").html(endpoint[1]);
  $("#example-output").html(JSON.stringify(endpoint[2], undefined, 2));
};

$(".endpoint").click(function() {
  $.fn.showResult(name)
});

// $("#all-transactions").click(function() {
//   $("#search-params").html(allTransactions[0])
//   $("#example-request").html(allTransactions[1])
//   $("#example-output").html(JSON.stringify(allTransactions[2], undefined, 2))
// });

// $("#one-transaction").click(function() {
//   $("#search-params").html("")
//   $("#example-request").html(oneTransaction[0])
//   $("#example-output").html(JSON.stringify(oneTransaction[1], undefined, 2))
// });


$("#search-many-transactions").click(function() {
  $("#search-params").html(transactionSearchParams)
  $("#example-request").html(searchAllTransactions[0])
  $("#example-output").html(JSON.stringify(searchAllTransactions[1], undefined, 2))
});


$("#search-one-transaction").click(function() {
  $("#search-params").html(transactionSearchParams)
  $("#example-request").html(searchOneTransaction[0])
  $("#example-output").html(JSON.stringify(searchOneTransaction[1], undefined, 2))
});

$("#transaction-invoice").click(function() {
  $("#search-params").html("")
  $("#example-request").html(transactionInvoice[0])
  $("#example-output").html(JSON.stringify(transactionInvoice[1], undefined, 2))
});
