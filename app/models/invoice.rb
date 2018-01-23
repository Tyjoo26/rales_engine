class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  enum status: ["shipped"]

  scope :serve, -> {select("id, customer_id, merchant_id, status").order("id ASC")}
end
