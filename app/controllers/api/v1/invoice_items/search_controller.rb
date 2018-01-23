class Api::V1::InvoiceItems::SearchController < Api::V1::BaseSearchController
  def index
    render json: InvoiceItem.serve.where(search(params))
  end

  def show
    render json: InvoiceItem.serve.where(search(params)).first
  end
end
