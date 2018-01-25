describe "HTTP Request for Favorite Merchant" do
  it "displays the favorite merchant for a specific customer" do
      customer = create(:customer)
      merchant_list = create_list(:merchant, 5)
      invoice_list = create_list(:invoice, 5, customer:customer, merchant:merchant_list.first)
      transaction_list = create_list(:transaction, 10, invoice:invoice_list.first)

      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      expect(response).to be_success

      merchant_response = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_response[:id]).to eq(merchant_list.first.id)
  end


  it "displays the favorite merchant for a specific customer with other customer & merchant & transcation & invoice information" do
      customer = create(:customer)
      merchant_list = create_list(:merchant, 5)
      invoice_list = create_list(:invoice, 5, customer:customer, merchant:merchant_list.first)
      transaction_list = create_list(:transaction, 10, invoice:invoice_list.first)

      customer_2 = create(:customer)
      merchant_list_2 = create_list(:merchant, 5)
      invoice_list_2 = create_list(:invoice, 5, customer:customer_2, merchant:merchant_list_2.first)
      transaction_list_2 = create_list(:transaction, 10, invoice:invoice_list_2.first)



      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      expect(response).to be_success

      merchant_response = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_response[:id]).to eq(merchant_list.first.id)
  end
end
