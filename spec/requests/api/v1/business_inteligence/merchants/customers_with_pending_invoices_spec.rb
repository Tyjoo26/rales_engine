describe "Merchant API" do
  context "GET a Merchant's customers with pending invoices" do
    it "has 1 customer with pending invoices" do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, customer: customer, merchant: merchant)
      create(:transaction, result: 1, invoice: invoice)

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

      response_customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response_customers.first["id"]).to eq(customer.id)
    end

    it "has 1 customer with a failed and successful transaction" do
      merchant = create(:merchant)
      customer_1 = create(:customer)
      invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
      create(:transaction, result: 1, invoice: invoice_1)

      customer_2 = create(:customer)
      invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)
      create(:transaction, result: 1, invoice: invoice_2)
      create(:transaction, result: 0, invoice: invoice_2)

      customer_3 = create(:customer)
      invoice_3 = create(:invoice, customer: customer_3, merchant: merchant)
      create(:transaction, result: 1, invoice: invoice_3)

      customer_4 = create(:customer)
      invoice_4 = create(:invoice, customer: customer_4, merchant: merchant)
      create(:transaction, result: 0, invoice: invoice_4)

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

      response_customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response_customers.first["id"]).to eq(customer_1.id)
      expect(response_customers.last["id"]).to eq(customer_3.id)
      expect(response_customers.include?({"id"=>customer_4.id})).to be_falsy
      expect(response_customers.include?({"id"=>customer_2.id})).to be_falsy
    end
  end
end
