FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status 0
    created_at "2012-03-06T16:54:31.000Z"
    updated_at "2012-03-06T16:54:31.000Z"
  end
end
