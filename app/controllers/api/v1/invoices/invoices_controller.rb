class Api::V1::Invoices::InvoicesController < ApplicationController
  def index
    render json: Invoice.serve.all
  end

  def show
    render json: Invoice.serve.find(params[:id])
  end
end
