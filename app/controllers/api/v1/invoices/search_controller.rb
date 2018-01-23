class Api::V1::Invoices::SearchController < Api::V1::BaseSearchController
  def index
    render json: Invoice.order("id ASC").where(search(params))
  end

  def show
    render json: Invoice.order("id ASC").where(search(params)).first
  end
end
