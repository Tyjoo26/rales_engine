class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if params[:name]
      merchant =  Merchant.where("name LIKE ?", "%#{params[:name]}%").first
    else
      merchant =  Merchant.where(merchant_params).first
    end
    render json: merchant
  end

  def index
    if params[:name]
      merchants = Merchant.where("name LIKE ?", "%#{params[:name]}%")
    else
      merchants = Merchant.where(merchant_params)
    end
    render json: merchants
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
