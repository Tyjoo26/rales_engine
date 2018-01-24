describe "Revenue Business Intelligence Methods" do
  it "GET total revenue associated with specific merchant" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant: merchant)
    invoice = create(:invoice,customer:customer, merchant:merchant)
    invoice_items = create_list(:invoice_item, 4, invoice: invoice, item: item)
    transaction = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    total_revenue = JSON.parse(response.body)

  end
end
