FactoryBot.define do
  factory :transaction do
    invoice nil
    credit_card_number 1
    credit_card_expiration_date "MyString"
    result 1
    created_at "2012-03-06T16:54:31.000Z"
    updated_at "2012-03-06T16:54:31.000Z"
  end
end
