describe "HTTP request for relations Invoice items items endpoint" do
  it "displays associated item for specific invoice item" do
    item = create(:item)
    iitems = create_list(:invoice_item, 5, item: item)

    get "/api/v1/invoice_items/#{iitems.first.id}/item"

    expect(response).to be_success

    ii_response = JSON.parse(response.body)
    expect(ii_response["id"]).to be(item.id)

  end
end
