class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def index
    total_revenue = Invoice.total_revenue(params[:date])
    render json: {total_revenue: revenue_in_dollars(total_revenue)}
  end
end
