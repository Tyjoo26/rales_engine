describe "Merchant Relationship API" do
  context "GET :id/items" do
    it "returns items for specific merchant" do
      merchant = create(:merchant)
      item_1, item_2, item_3 = create_list(:item, 3, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      response_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_items.count).to eq(3)
      expect(response_items[0]["id"]).to eq(item_1.id)
      expect(response_items[1]["id"]).to eq(item_2.id)
      expect(response_items[2]["id"]).to eq(item_3.id)
    end
  end

  context "GET :id/invoices" do
    it "returns invoices for specific merchant" do
      merchant = create(:merchant)
      invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      response_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoices.count).to eq(3)
      expect(response_invoices[0]["id"]).to eq(invoice_1.id)
      expect(response_invoices[1]["id"]).to eq(invoice_2.id)
      expect(response_invoices[2]["id"]).to eq(invoice_3.id)
    end
  end
end
