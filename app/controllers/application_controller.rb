class ApplicationController < ActionController::API
  def price_to_integer(price_as_string)
    (price_as_string.to_f * 100).round(0)
  end
end
