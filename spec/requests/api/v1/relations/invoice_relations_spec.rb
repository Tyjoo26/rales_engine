describe "HTTP Request invoice relations" do
  it "displays collection of items associated with  specific invoice" do
    invoice = create(:invoice)
    transactions = create_list(:transaction, 5, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response.first["invoice_id"]).to be(invoice.id)
    expect(item_response.fifth["invoice_id"]).to be(invoice.id)
  end
end
