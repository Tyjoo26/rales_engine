class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def index
    total_revenue = Invoice.merchants_total_revenue(params[:date])
    render json: {total_revenue: revenue_in_dollars(total_revenue)}
  end

  def show
    if params[:date]
      revenue = Invoice.merchant_total_revenue_by_date(params[:date], params[:id].to_i)
    else
      revenue = Invoice.merchant_total_revenue(params[:id].to_i)
    end
    render json: {"revenue" => revenue_in_dollars(revenue)}
  end
end
