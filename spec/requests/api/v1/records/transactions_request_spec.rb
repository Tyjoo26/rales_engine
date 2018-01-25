
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

  context "find query for transaction attributes" do
    it "can find transaction by id" do
      invoice = create(:invoice)
      transact_id = create(:transaction, invoice: invoice).id

      get "/api/v1/transactions/find?id=#{transact_id}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse[:id]).to eq(transact_id)
    end

    it "can find transaction by credit_card_number" do
      invoice = create(:invoice)
      transact = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/find?credit_card_number=#{transact.credit_card_number}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse[:credit_card_number]).to eq(transact.credit_card_number)
    end

    it "can find transaction by invoice_id" do
      invoice = create(:invoice)
      transact = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/find?invoice_id=#{transact.invoice_id}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)


      expect(tresponse[:invoice_id]).to eq(transact.invoice_id)
    end

    it "can find transaction by result" do
      invoice = create(:invoice)
      transact = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/find?result=#{transact.result}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse[:result]).to eq(transact.result)
    end
  end

  context "Find all queries" do
    it "finds all queries by id" do
      invoice = create(:invoice)
      transact_list = create_list(:transaction,4)
      transact = create(:transaction).id
      get "/api/v1/transactions/find_all?id=#{transact}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse.count).to eq(1)
    end

    it "finds all queries by invoice_id" do
      invoice = create(:invoice)
      transact_list = create_list(:transaction,4, invoice: invoice)
      transact = transact_list.last

      get "/api/v1/transactions/find_all?invoice_id=#{transact.invoice_id}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse.count).to eq(4)
    end

    it "finds all queries by credit_card_number" do
      invoice = create(:invoice)
      transact_list = create_list(:transaction,4, invoice: invoice).last


      get "/api/v1/transactions/find_all?credit_card_number=#{transact_list.credit_card_number}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse.count).to eq(4)
    end
    it "finds all queries by result" do
      invoice = create(:invoice)
      transact_list = create_list(:transaction,4, invoice: invoice).last


      get "/api/v1/transactions/find_all?result=#{transact_list.result}"

      expect(response).to be_success

      tresponse = JSON.parse(response.body, symbolize_names:true)

      expect(tresponse.count).to eq(4)
    end

  end
end
