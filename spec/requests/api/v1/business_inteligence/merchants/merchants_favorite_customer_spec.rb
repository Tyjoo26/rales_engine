describe "Merchant API" do
  context "GET customer with most successful transactions" do
    it "merchant has 1 customer with a transaction" do
      customer = create(:customer)
      merchant = create(:merchant)
      successful = create(:transaction, result: 0)
      create_list(:invoice, 5, customer: customer, merchant: merchant, transactions: [successful])

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      favorite_customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(favorite_customer["id"]).to eq(customer.id)
    end

    it "merchant has 3 customers with a transaction" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      customer_3 = create(:customer)
      merchant = create(:merchant)
      create_list(:invoice, 5, customer: customer_1, merchant: merchant, transactions: [create(:transaction)])
      create_list(:invoice, 2, customer: customer_2, merchant: merchant, transactions: [create(:transaction)])
      create_list(:invoice, 1, customer: customer_3, merchant: merchant, transactions: [create(:transaction)])

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      favorite_customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(favorite_customer["id"]).to eq(customer_1.id)
    end

    it "merchant has 2 customers with same # of transactions" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      merchant = create(:merchant)
      create_list(:invoice, 5, customer: customer_1, merchant: merchant, transactions: [create(:transaction)])
      create_list(:invoice, 5, customer: customer_2, merchant: merchant, transactions: [create(:transaction)])

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      favorite_customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(favorite_customer["id"]).to eq(customer_1.id)
    end
  end
end
