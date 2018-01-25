describe "Item API" do
  context "GET items with most revenue" do
    it "return 1 item" do
      item = create(:item)
      create_list(:invoice_item, 10, item: item, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 5)

      get "/api/v1/items/most_revenue?quantity=1"

      response_items = JSON.parse(response.body)

      expect(response_items.count).to eq(1)
      expect(response_items.first["id"]).to eq(item.id)
    end

    it "return 1 item, if two are tied return lower id" do
      item_1 = create(:item)
      item_2 = create(:item)
      create_list(:invoice_item, 10, item: item_1, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 10, item: item_2, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 5)

      get "/api/v1/items/most_revenue?quantity=1"

      response_items = JSON.parse(response.body)

      expect(response_items.count).to eq(1)
      expect(response_items.first["id"]).to eq(item_1.id)
    end

    it "return 2 items" do
      item_1 = create(:item)
      item_2 = create(:item)
      create_list(:invoice_item, 10, item: item_1, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 5, item: item_2, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 5)

      get "/api/v1/items/most_revenue?quantity=2"

      response_items = JSON.parse(response.body)

      expect(response_items.count).to eq(2)
      expect(response_items.first["id"]).to eq(item_1.id)
      expect(response_items.last["id"]).to eq(item_2.id)
    end

    it "return 5 items" do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)

      create_list(:invoice_item, 10, item: item_1, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 7, item: item_2, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 5, item: item_3, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 3, item: item_4, quantity: 5, unit_price: 15000)
      create_list(:invoice_item, 1, item: item_5, quantity: 5, unit_price: 15000)

      get "/api/v1/items/most_revenue?quantity=5"

      response_items = JSON.parse(response.body)

      expect(response_items.count).to eq(5)
      expect(response_items.first["id"]).to eq(item_1.id)
      expect(response_items.last["id"]).to eq(item_5.id)
    end
  end
end
