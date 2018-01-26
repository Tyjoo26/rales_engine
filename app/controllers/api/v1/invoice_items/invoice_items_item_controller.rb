class Api::V1::InvoiceItems::InvoiceItemsItemController < ApplicationController


  def index
    render json: InvoiceItem.find(params[:id]).item
  end
end
