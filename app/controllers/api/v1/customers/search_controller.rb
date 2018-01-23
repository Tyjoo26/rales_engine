class Api::V1::Customers::SearchController < ApplicationController


  def show
    if params["name"]
      render json: Customer.find_by(first_name: params["name"])
    else params["id"]
      render json: Customer.find(params[:id])
    # elsif params["created_at"]
    #   render json: Customer.find_by(created_at: )
    end
  end

  def index
    if params["name"]
      render json: Customer.where(first_name: params["name"])
    else params["id"]
      render json: Customer.where(id: params["id"])
    # elsif params["created_at"]
    end
  end
end
