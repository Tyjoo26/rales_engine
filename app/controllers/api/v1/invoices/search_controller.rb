class Api::V1::Invoices::SearchController < ApplicationController
  def index

  end

  def show
    if params[:created_at] || params[:updated_at]
      invoice = Invoice.where(date_search(params)).first
    else
      invoice = Invoice.find_by(search(params))
    end
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
    end
  end

  def date_search(params)
    if params[:created_at]
      created_date = Date.parse(params[:created_at])
      {created_at: created_date.beginning_of_day..created_date.end_of_day}
    elsif params[:updated_at]
      updated_date = Date.parse(params[:updated_at])
      {updated_at: updated_date.beginning_of_day..updated_date.end_of_day}
    end
  end
end
