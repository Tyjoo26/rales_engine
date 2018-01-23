class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    render json: InvoiceItem.order("id ASC").where(search(params))
  end

  def show
    render json: InvoiceItem.order("id ASC").where(search(params)).first
  end

  private
    def search_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    end
end
