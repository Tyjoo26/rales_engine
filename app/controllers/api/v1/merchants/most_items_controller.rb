class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    merchants = Invoice.select("merchants.*, sum(invoice_items.quantity) AS total_items").joins(:invoice_items).joins(:merchant).joins(:transactions).merge(Transaction.successful).group("merchants.id").order("total_items DESC").limit(params[:quantity])

    render json: merchants, each_serializer: MerchantSerializer
  end
end
