class Api::V1::InvoiceItems::SearchController < Api::V1::BaseSearchController
  def index
    render json: InvoiceItem.order("id ASC").where(search(params))
  end

  def show
    render json: InvoiceItem.order("id ASC").where(search(params)).first
  end
end
