describe "Invoice API" do
  context 'GET Invoices' do
    it "returns all invoices" do
      create_list(:invoice, 5)

      get '/api/v1/invoices'

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(5)
    end
  end

  context "GET Invoice" do
    it "returns specific invoice" do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end
  end

  context "GET first invoice with" do
    it "invoice id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "customer id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "merchant id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "status" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?status=#{invoice.status}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "created at" do
      invoice = create(:invoice)
      date = (invoice.created_at)

      get "/api/v1/invoices/find?created_at=#{date}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "updated at" do
      invoice = create(:invoice)
      date = (invoice.updated_at)

      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end
  end

  context "GET all invoices with" do
    it "invoice id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find_all?id=#{invoice.id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "customer id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find_all?customer_id=#{invoice.customer_id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "merchant id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find_all?merchant_id=#{invoice.merchant_id}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "status" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find_all?status=#{invoice.status}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "created at" do
      invoice = create(:invoice)
      date = (invoice.created_at)

      get "/api/v1/invoices/find_all?created_at=#{date}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end

    it "updated at" do
      invoice = create(:invoice)
      date = (invoice.updated_at)

      get "/api/v1/invoices/find_all?updated_at=#{invoice.updated_at}"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end
  end
end
