FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity 1
    unit_price 999
    created_at "2012-03-06T16:54:31.000Z"
    updated_at "2012-03-06T16:54:31.000Z"
  end
end
