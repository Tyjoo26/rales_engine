describe "HTTP Request invoice relations" do
  it "displays collection of items associated with  specific invoice" do
    invoice = create(:invoice)
    item = create_list(:item, 5)
    ii = create(:invoice_item, invoice: invoice, item: item.first)
    ii_2= create(:invoice_item, invoice: invoice, item: item.first)
    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_success

    item_response = JSON.parse(response.body)
    
    expect(item_response.first["id"]).to eq(item.first.id)
    expect(item_response.second["id"]).to eq(item.first.id)
  end
end
