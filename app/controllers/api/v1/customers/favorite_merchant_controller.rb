class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    favorite_merchant = Merchant.select("merchants.*, count(invoices.*) AS count_all").joins(:transactions,:customers, :invoices).where(customers:{id: params[:id]}).where(transactions: {result: "success"}).group("merchants.id").order("count_all DESC").limit(1)[0]

    render json: favorite_merchant
  end

end
