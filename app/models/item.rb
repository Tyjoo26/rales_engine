class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  default_scope {order(:id)}

  def self.most_revenue(quantity)
    select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items)
      .group("items.id")
      .order("revenue DESC, items.id ASC")
      .limit(quantity)
  end

  def self.most_items_quantity(quantity)
    select("items.*, count(items.*) as total_items")
      .joins(:invoices, :transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .group("items.id")
      .order("total_items DESC")
      .limit(quantity)
  end
end
