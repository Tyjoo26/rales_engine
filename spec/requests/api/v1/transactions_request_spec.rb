
describe "Transactions API" do
  context "HTTP GET REQUESTS" do
    it "sends a list of transactions" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice, customer: customer, merchant: merchant)

      transactions = create_list(:transaction, 2, invoice: invoice)

      get "/api/v1/transactions"

      expect(response).to be_success

      transacts = JSON.parse(response.body)
      expect(transacts.count).to eq(2)
    end

    it "sends a specific transaction" do
      customer = create(:customer)
      merchant = create(:merchant)
      invoice = create(:invoice, customer: customer, merchant: merchant)

      transaction_id = create(:transaction, invoice: invoice).id

      get "/api/v1/transactions/#{transaction_id}"

      expect(response).to be_success

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction[:id]).to eq(transaction_id)
    end
  end
end
