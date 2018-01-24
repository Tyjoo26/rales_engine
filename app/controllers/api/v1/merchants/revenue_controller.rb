class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:created_at] == nil
      merchant = Merchant.joins(:invoice_items).joins(:transactions).where("transactions.result = 0 AND merchants.id = ?", params[:id]).sum("invoice_items.unit_price * invoice_items.quantity")
    else
      merchant = Merchant.joins(:invoice_items).joins(:transactions).where("transactions.result = 0 AND merchants.id = ?", params[:id]).sum("invoice_items.unit_price * invoice_items.quantity")
    end
    render json: {"revenue" => merchant}
  end

end
