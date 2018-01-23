class Item < ApplicationRecord
  belongs_to :merchant

  scope :serve, -> {select("id, name, description, unit_price, merchant_id")}
end
