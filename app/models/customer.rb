class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer(merchant)
    select("customers.*, count(*) AS count_all")
      .joins(:invoices)
      .joins(:transactions)
      .group("customers.id")
      .order("count_all DESC")
      .merge(Transaction.successful)
      .where("invoices.merchant_id = ?", merchant)
      .first
  end
end
