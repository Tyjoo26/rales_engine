class Api::V1::Items::ItemsController < ApplicationController
  def index
    render json: Item.serve.all
  end

  def show
    render json: Item.serve.find(params[:id])
  end
end
