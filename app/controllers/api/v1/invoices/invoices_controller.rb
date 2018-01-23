class Api::V1::Invoices::InvoicesController < ApplicationController
  def index
    render json: Invoice.all.order("id ASC")
  end

  def show
    render json: Invoice.find(params[:id])
  end
end
