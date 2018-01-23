FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number "0000111122223333"
    credit_card_expiration_date "MyString"
    result 0
    created_at "2012-03-06T16:54:31.000Z"
    updated_at "2012-03-06T16:54:31.000Z"
  end
end
