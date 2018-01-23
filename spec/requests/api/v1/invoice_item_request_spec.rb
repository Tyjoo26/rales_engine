describe "Invoice Item API" do
  context "GET Invoice Items" do
    it "returns all invoice items" do
      create_list(:invoice_item, 5)

      get '/api/v1/invoice_items'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(5)
    end
  end

  context "GET Invoice Item" do
    it "returns specific invoice items" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/#{invoice_item.id}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end
  end

  context "GET First Invoice Item with" do
    it "id" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end

    it "item_id" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end

    it "invoice_id" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end

    it "quantity" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end

    it "unit_price" do
      invoice_item = create_list(:invoice_item, 5).first
      unit_price = (invoice_item.unit_price/100.00).to_s

      get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"]).to eq(invoice_item.id)
    end

    it "created_at" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end

    it "updated_at" do
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item["id"].to_i).to eq(invoice_item.id)
    end
  end

  context "GET Invoice Items with" do
    it "id" do
      create_list(:invoice_item, 4)
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find_all?id=#{invoice_item.id}"

      response_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_item.count).to eq(1)
    end

    it "item_id" do\
      item = create(:item)
      create_list(:invoice_item, 4)
      invoice_item = create_list(:invoice_item, 5, item: item).first

      get "/api/v1/invoice_items/find_all?item_id=#{invoice_item.item_id}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end

    it "invoice_id" do
      invoice = create(:invoice)
      create_list(:invoice_item, 4)
      invoice_item = create_list(:invoice_item, 5, invoice: invoice).first

      get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item.invoice_id}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end

    it "quantity" do
      create_list(:invoice_item, 4, quantity: 2)
      invoice_item = create_list(:invoice_item, 5, quantity: 5).first

      get "/api/v1/invoice_items/find_all?quantity=#{invoice_item.quantity}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end

    it "unit_price" do
      create_list(:invoice_item, 4)
      invoice_item = create_list(:invoice_item, 5, unit_price: "2.42").first
      unit_price = (invoice_item.unit_price/100.00).to_s

      get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end

    it "created_at" do
      create_list(:invoice_item, 4, created_at: DateTime.yesterday)
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find_all?created_at=#{invoice_item.created_at}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end

    it "updated_at" do
      create_list(:invoice_item, 4, updated_at: DateTime.yesterday)
      invoice_item = create_list(:invoice_item, 5).first

      get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item.updated_at}"

      response_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice_items.count).to eq(5)
    end
  end

  context "GET random invoice_item" do
    it "returns a success response" do
      create_list(:invoice_item, 4, updated_at: DateTime.yesterday)

      get "/api/v1/invoice_items/random"

      expect(response).to be_success
    end
  end
 end
