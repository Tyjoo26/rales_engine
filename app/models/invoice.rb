class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items

  enum status: ["shipped"]

  def self.total_revenue(date)
    joins(:transactions)
      .joins(:invoice_items)
      .merge(Transaction.successful)
      .where("invoices.updated_at >= ?", start_of_day(date))
      .where("invoices.updated_at <= ?", end_of_day(date))
      .sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
