class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchants = Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
                        .joins(:invoice_items)
                        .group("merchants.id")
                        .order("revenue DESC, merchants.id ASC")
                        .limit(params[:quantity])
    render json: merchants
  end
end
