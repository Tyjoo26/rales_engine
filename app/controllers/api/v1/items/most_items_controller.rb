class Api::V1::Items::MostItemsController < ApplicationController

  def index
    item = Item.unscoped.most_items_quantity(params[:quantity])

    render json: item
  end
end
