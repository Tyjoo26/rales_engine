describe "Merchants API" do
  context "GET Merchant with most revenue" do
    it "get 1 of 1 merchant" do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)
      invoice = create(:invoice, merchant: merchant)
      create(:transaction, invoice: invoice, result: "success")
      create_list(:invoice_item, 5, item: item, invoice: invoice, quantity: 5, unit_price: 100)

      get "/api/v1/merchants/most_revenue?quantity=1"

      response_merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response_merchants.count).to eq(1)
      expect(response_merchants.first["id"]).to eq(merchant.id)
    end

    it "get 1 of 2 merchants with same revenue" do
      merchant_1 = create(:merchant)
      item_1 = create(:item, merchant: merchant_1)
      invoice_1 = create(:invoice, merchant: merchant_1)
      create(:transaction, invoice: invoice_1, result: "success")
      create_list(:invoice_item, 5, item: item_1, invoice: invoice_1, quantity: 5, unit_price: 100)

      merchant_2 = create(:merchant)
      item_2 = create(:item, merchant: merchant_2)
      invoice_2 = create(:invoice, merchant: merchant_2)
      create(:transaction, invoice: invoice_2, result: "success")
      create_list(:invoice_item, 5, item: item_2, invoice: invoice_2, quantity: 5, unit_price: 100)

      get "/api/v1/merchants/most_revenue?quantity=1"

      response_merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response_merchants.count).to eq(1)
      expect(response_merchants.first["id"]).to eq(merchant_1.id)
    end

    it "get 3 of 5 merchants" do
      merchant_1 = create(:merchant)
      item_1 = create(:item, merchant: merchant_1)
      invoice_1 = create(:invoice, merchant: merchant_1)
      create(:transaction, invoice: invoice_1, result: "success")
      create_list(:invoice_item, 5, item: item_1, invoice: invoice_1, quantity: 5, unit_price: 100)

      merchant_2 = create(:merchant)
      item_2 = create(:item, merchant: merchant_2)
      invoice_2 = create(:invoice, merchant: merchant_2)
      create(:transaction, invoice: invoice_2, result: "success")
      create_list(:invoice_item, 5, item: item_2, invoice: invoice_2, quantity: 4, unit_price: 100)

      merchant_3 = create(:merchant)
      item_3 = create(:item, merchant: merchant_3)
      invoice_3 = create(:invoice, merchant: merchant_3)
      create(:transaction, invoice: invoice_3, result: "success")
      create_list(:invoice_item, 5, item: item_3, invoice: invoice_3, quantity: 3, unit_price: 100)

      merchant_4 = create(:merchant)
      item_4 = create(:item, merchant: merchant_4)
      invoice_4 = create(:invoice, merchant: merchant_4)
      create(:transaction, invoice: invoice_4, result: "success")
      create_list(:invoice_item, 5, item: item_4, invoice: invoice_4, quantity: 2, unit_price: 100)

      merchant_5 = create(:merchant)
      item_5 = create(:item, merchant: merchant_5)
      invoice_5 = create(:invoice, merchant: merchant_5)
      create(:transaction, invoice: invoice_5, result: "success")
      create_list(:invoice_item, 5, item: item_5, invoice: invoice_5, quantity: 1, unit_price: 100)

      get "/api/v1/merchants/most_revenue?quantity=3"

      response_merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response_merchants.count).to eq(3)
      expect(response_merchants.first["id"]).to eq(merchant_1.id)
      expect(response_merchants.last["id"]).to eq(merchant_3.id)
    end
  end
end
