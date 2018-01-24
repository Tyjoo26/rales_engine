class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def index
    total_revenue = Invoice.joins(:transactions)
                           .joins(:invoice_items)
                           .where("transactions.result = 0")
                           .sum("invoice_items.unit_price * invoice_items.quantity")
    render json: {total_revenue: revenue_in_dollars(total_revenue)}
  end

  private
    def revenue_in_dollars(revenue)
      '%.2f' % (revenue/100.00)
    end
end
