$.getScript("js/merchants.js", function() {});
$.getScript("js/transactions.js", function() {});
$.getScript("js/customers.js", function() {});
$.getScript("js/invoices.js", function() {});
$.getScript("js/items.js", function() {});
$.getScript("js/invoice_items.js", function() {});
$.getScript("js/business_intelligence.js", function() {});

function kebabToCamel(string){
  return string.replace(/(\-\w)/g, function(m){return m[1].toUpperCase();})
}

$.fn.showResult = function(endpoint) {
  $("#search-params").html(endpoint[0]);
  $("#example-request").html(endpoint[1]);
  $("#example-output").html(JSON.stringify(endpoint[2], undefined, 2));
};

$(".endpoint").click(function() {
  $.fn.showResult(eval(kebabToCamel($(this).attr('id'))))
});
