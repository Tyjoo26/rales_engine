class Api::V1::Items::RevenueController < ApplicationController
  def index
    items = Item.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
                .joins(:invoice_items)
                .group("items.id")
                .order("revenue DESC, items.id ASC")
                .limit(params[:quantity])

    render json: items
  end

end
