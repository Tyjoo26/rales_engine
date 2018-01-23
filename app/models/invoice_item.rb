class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  scope :serve, -> {select("id", "item_id", "invoice_id", "quantity", "unit_price")
                    .order("id ASC")}
end
