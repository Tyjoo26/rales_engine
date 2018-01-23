class Api::V1::Items::ItemsController < ApplicationController
  def index
    render json: Item.all.order("id ASC")
  end

  def show
    render json: Item.find(params[:id])
  end
end
