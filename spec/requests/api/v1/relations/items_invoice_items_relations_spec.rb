describe "HTTP request for relations items invoice_item endpoint" do
  it "displays associated invoice_item for specific item" do
    item = create(:item)
    iitems = create_list(:invoice_item, 5, item: item)


    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success
    item_response= JSON.parse(response.body)
    
    expect(item_response.first["item_id"]).to be(item.id)

  end
end
