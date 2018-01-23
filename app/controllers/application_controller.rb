class ApplicationController < ActionController::API
  def price_to_integer(price_as_string)
    (price_as_string.to_f * 100).to_i
  end
end
