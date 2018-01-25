describe "GET Request most items by quantity" do
  it "displays top x merchant ranked by total numbers of items sold" do
    merchant_list = create_list(:merchant, 5)
    invoice_list = create_list(:invoice,5, merchant: merchant_list.first)
    item_list = create_list(:item, 5)
    invoice_item_list = create_list(:invoice_item, 5,  invoice: invoice_list.first, item: item_list.first)
    transaction_list = create_list(:transaction, 5, invoice: invoice_list.first)

    get "/api/v1/items/most_items?quantity=1"

    expect(response).to be_success

    item_response = JSON.parse(response.body, symbolize_names: true)

    expect(item_response[0][:id]).to eq(item_list.first.id)
  end
end
