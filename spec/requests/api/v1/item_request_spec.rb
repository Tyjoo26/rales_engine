describe "Item API" do
  context "GET Items" do
    it "returns all items" do
      create_list(:item, 5)

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(5)
    end
  end

  context "GET item" do
    it "returns specific item" do
      item = create_list(:item, 5).first

      get "/api/v1/items/#{item.id}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end
  end

  context "GET first item with" do
    it "id" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?id=#{item.id}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "name" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?name=#{item.name}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "description" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?description=#{item.description}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "unit_price" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?unit_price=#{item.unit_price}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "merchant id" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?merchant_id=#{item.merchant.id}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "created_at" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?created_at=#{item.created_at}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end

    it "updated_at" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find?updated_at=#{item.updated_at}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item["id"]).to eq(item.id)
    end
  end

  context "GET all items with" do
    it "id" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?id=#{item.id}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(1)
      expect(response_item.first["id"]).to eq(item.id)
    end

    it "name" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?name=#{item.name}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end

    it "description" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?description=#{item.description}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end

    it "unit_price" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?unit_price=#{item.unit_price}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end

    it "merchant id" do
      merchant = create(:merchant)
      item = create_list(:item, 5, merchant: merchant).first

      get "/api/v1/items/find_all?merchant_id=#{item.merchant.id}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end

    it "created_at" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?created_at=#{item.created_at}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end

    it "updated_at" do
      item = create_list(:item, 5).first

      get "/api/v1/items/find_all?updated_at=#{item.updated_at}"

      response_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_item.count).to eq(5)
    end
  end
end
