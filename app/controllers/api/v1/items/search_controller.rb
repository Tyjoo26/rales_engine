class Api::V1::Items::SearchController < ApplicationController
  def show
    if params[:name]
      item = Item.where("name LIKE ?", "%#{params[:name]}%").first
    elsif params[:description]
      item = Item.where("description LIKE ?", "%#{params[:description]}%").first
    else
      item = Item.where(search_params).first
    end
    render json: item
  end

  def index
    if params[:name]
      items = Item.where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:description]
      items = Item.where("description LIKE ?", "%#{params[:description]}%")
    else
      items = Item.where(search_params)
    end
    render json: items
  end

  private
    def search_params
      params[:unit_price] = price_to_integer(params[:unit_price])  if params[:unit_price]
      params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at )
    end
end
