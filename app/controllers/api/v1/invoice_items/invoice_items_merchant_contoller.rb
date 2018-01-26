class Api::V1::InvoiceItems::InvoiceItemsMerchantController < ApplicationController
  def show
    render json: InvoiceItem.find(params[:id]).merchant
  end
end
