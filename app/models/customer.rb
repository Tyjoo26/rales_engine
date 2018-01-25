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

  def self.customers_with_pending_invoices(merchant)
    find_by_sql("SELECT c.* FROM customers c
                JOIN invoices i ON c.id=i.customer_id
                JOIN transactions t ON i.id=t.invoice_id
                WHERE i.merchant_id = #{merchant}
                  AND t.result = 1
                EXCEPT
                SELECT c.* FROM customers c
                JOIN invoices i ON c.id=i.customer_id
                JOIN transactions t ON i.id=t.invoice_id
                WHERE i.merchant_id = #{merchant}
                  AND t.result = 0
                ORDER BY 1")
  end
end
