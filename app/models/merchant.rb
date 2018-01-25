class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  has_many :items
  has_many :invoice_items, through: :invoices

  def self.most_revenue(quantity)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items)
      .group("merchants.id")
      .order("revenue DESC, merchants.id ASC")
      .limit(quantity)
  end

  def self.customer_favorite_merchant(id)
    select("merchants.*, count(invoices.*) AS count_all")
      .joins(:transactions,:customers, :invoices)
      .where(customers:{id:id})
      .merge(Transaction.successful)
      .group("merchants.id")
      .order("count_all DESC")
      .limit(1)[0]
  end
end
