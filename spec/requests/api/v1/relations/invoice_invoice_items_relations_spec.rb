describe "HTTP Request invoice relations" do
  it "displays collection of items associated with  specific invoice_item" do
    invoice = create(:invoice)
    iitems = create_list(:invoice_item, 5, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response.first["invoice_id"]).to be(invoice.id)
    expect(item_response.fifth["invoice_id"]).to be(invoice.id)
  end
end
