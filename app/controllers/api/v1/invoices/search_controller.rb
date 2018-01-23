class Api::V1::Invoices::SearchController < Api::V1::BaseSearchController
  def index
    render json: Invoice.where(search(params))
  end

  def show
    render json: Invoice.where(search(params)).first
  end
end
