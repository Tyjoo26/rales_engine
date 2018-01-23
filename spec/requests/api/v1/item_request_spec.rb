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
end
