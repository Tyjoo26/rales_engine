class Api::V1::BaseSearchController < ApplicationController
  def search(params)
    if params[:id]
      {id: params[:id]}
    elsif params[:name]
      {name: params[:name]}
    elsif params[:description]
      {description: params[:description]}
    elsif params[:unit_price]
      {unit_price: params[:unit_price]}
    elsif params[:quantity]
      {quantity: params[:quantity]}
    elsif params[:item_id]
      {item_id: params[:item_id]}
    elsif params[:invoice_id]
      {invoice_id: params[:invoice_id]}
    elsif params[:merchant_id]
      {merchant_id: params[:merchant_id]}
    elsif params[:customer_id]
      {customer_id: params[:customer_id]}
    elsif params[:status]
      {status: params[:status]}
    elsif params[:created_at]
      {created_at: params[:created_at]}
    elsif params[:updated_at]
      {updated_at: params[:updated_at]}
    end
  end
end
