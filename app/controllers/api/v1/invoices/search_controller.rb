class Api::V1::Invoices::SearchController < ApplicationController
  def index
    invoice = Invoice.where(search(params))
    render json: invoice
  end

  def show
    invoice = Invoice.where(search(params)).first
    render json: invoice
  end

  def search(params)
    if params[:id]
      {id: params[:id]}
    elsif params[:customer_id]
      {customer_id: params[:customer_id]}
    elsif params[:merchant_id]
      {merchant_id: params[:merchant_id]}
    elsif params[:status]
      {status: params[:status]}
    elsif params[:created_at]
      {created_at: DateTime.parse(params[:created_at])}
    elsif params[:updated_at]
      {updated_at: DateTime.parse(params[:updated_at])}
    end
  end

  def date_search(params)

  end
end
