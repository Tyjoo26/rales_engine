FactoryBot.define do
  factory :transaction do
    invoice nil
    credit_card_number 0000111122223333
    credit_card_expiration_date "11/22"
    result 0
  end
end
