class Api::V1::InvoiceItems::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItem.serve.all
  end

  def show
    render json: InvoiceItem.serve.find(params[:id])
  end

end
