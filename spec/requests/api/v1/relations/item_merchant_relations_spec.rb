describe "HTTP Request items relations" do
  it "displays a merchant associated with  specific item" do
    merchant = create_list(:merchant, 5)

    item = create(:item, merchant: merchant.first)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response["id"]).to eq(merchant.first.id)

  end
end
