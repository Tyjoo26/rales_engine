class Api::V1::Items::SearchController < ApplicationController
  def index
    render json: Item.order("id ASC").where(search_params)
  end

  def show
    render json: Item.order("id ASC").where(search_params).first
  end

  private
    def search_params
      params[:unit_price] = price_to_integer(params[:unit_price]) if params[:unit_price]
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at )
    end
end
