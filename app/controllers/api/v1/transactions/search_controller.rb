class Api::V1::Merchants::SearchController < ApplicationController


  def show
    render json: Merchant.where(transaction_params).first
  end

  def index
    render json: Merchant.where(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :invoice, :credit_card_number, :credit_card_expiration_date, :result)
  end
end
