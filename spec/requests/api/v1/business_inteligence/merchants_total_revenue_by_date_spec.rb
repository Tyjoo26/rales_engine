describe "Mechants API" do
  context "GET total merchant revenue by date" do
    it "returns total revenue for a merchant" do
      created_date = "2012-03-16"
      merchant = create(:merchant)
      successful_1 = create(:transaction, result: 0)
      successful_2 = create(:transaction, result: 0)
      invoice_1 = create(:invoice, merchant: merchant, transactions: [successful_1], updated_at: created_date)
      invoice_2 = create(:invoice, merchant: merchant, transactions: [successful_2], updated_at: created_date)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_1)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_2)

      get "/api/v1/merchants/revenue?date=#{created_date}"

      total_revenue = JSON.parse(response.body)

      expect(response).to be_successful
      expect(total_revenue["total_revenue"]).to eq("1.00")
    end

    it "only returns total revenue for successful transactions" do
      created_date = "2012-03-16"
      merchant = create(:merchant)
      successful = create(:transaction, result: 0)
      failed = create(:transaction, result: 1)
      invoice_1 = create(:invoice, merchant: merchant, transactions: [successful], updated_at: created_date)
      invoice_2 = create(:invoice, merchant: merchant, transactions: [failed], updated_at: created_date)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_1)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_2)

      get "/api/v1/merchants/revenue?date=#{created_date}"

      total_revenue = JSON.parse(response.body)

      expect(response).to be_successful
      expect(total_revenue["total_revenue"]).to eq("0.50")
    end

    it "only returns total revenue for that date" do
      created_date = "2012-03-16"
      other_date = "2012-03-17"
      merchant = create(:merchant)
      successful_1 = create(:transaction, result: 0)
      successful_2 = create(:transaction, result: 0)
      invoice_1 = create(:invoice, merchant: merchant, transactions: [successful_1], updated_at: created_date)
      invoice_2 = create(:invoice, merchant: merchant, transactions: [successful_2], updated_at: other_date)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_1)
      create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_2)

      get "/api/v1/merchants/revenue?date=#{created_date}"

      total_revenue = JSON.parse(response.body)

      expect(response).to be_successful
      expect(total_revenue["total_revenue"]).to eq("0.50")
    end
  end
end
