class Api::V1::InvoiceItems::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.all.order("id ASC")
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

end
