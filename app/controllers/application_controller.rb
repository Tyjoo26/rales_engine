class ApplicationController < ActionController::API
  def price_to_integer(price_as_string)
    (JSON.parse(price_as_string).to_f * 100.00).round(0).to_i
  end
end
