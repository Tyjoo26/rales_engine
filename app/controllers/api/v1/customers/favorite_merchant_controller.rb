class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    favorite_merchant = Merchant.customer_favorite_merchant(params[:id])

    render json: favorite_merchant
  end

end
