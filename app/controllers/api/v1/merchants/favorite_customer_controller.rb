class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    favorite_customer = Customer.select("customers.*, count(*) AS count_all")
                                .joins(:invoices)
                                .joins(:transactions)
                                .group("customers.id")
                                .order("count_all DESC")
                                .where("invoices.merchant_id = ? AND transactions.result = 0", params[:id])
                                .first

    render json: favorite_customer
  end
end
