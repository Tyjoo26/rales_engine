class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def index
    total_revenue = Invoice.total_revenue(params[:date])
    render json: {total_revenue: revenue_in_dollars(total_revenue)}
  end

  private
    def revenue_in_dollars(revenue)
      '%.2f' % (revenue/100.00)
    end
end
