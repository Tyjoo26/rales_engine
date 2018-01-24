class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:date]
      revenue = Invoice.merchant_total_revenue_by_date(params[:date], params[:id].to_i)
    else
      revenue = Invoice.merchant_total_revenue(params[:id].to_i)
    end
    render json: {"revenue" => revenue_in_dollars(revenue)}
  end
end
