describe "HTTP Request invoice relations" do
  it "displays a merchant associated with  specific invoice" do
    merchant = create_list(:merchant, 5)

    invoice = create(:invoice, merchant: merchant.first)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response["id"]).to eq(merchant.first.id)

  end
end
