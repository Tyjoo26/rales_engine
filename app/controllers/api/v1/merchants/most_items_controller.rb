class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    merchants = Invoice.most_items_sold(params[:quantity])

    render json: merchants, each_serializer: MerchantSerializer
  end
end
