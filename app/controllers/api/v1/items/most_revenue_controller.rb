class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    render json: Item.unscoped.most_revenue(params[:quantity])
  end
end
