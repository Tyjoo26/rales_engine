class ApplicationController < ActionController::API
  def price_to_integer(price_as_string)
    (price_as_string.to_f * 100).round(0)
  end

  def revenue_in_dollars(revenue)
    '%.2f' % (revenue/100.00)
  end
end
