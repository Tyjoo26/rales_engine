describe "HTTP request for relations Invoice items invoice endpoint" do
  it "displays associated invoice for specific invoice item" do
    invoice = create(:invoice)
    iitems = create_list(:invoice_item, 5, invoice: invoice)

    get "/api/v1/invoice_items/#{iitems.first.id}/invoice"

    expect(response).to be_success

    ii_response = JSON.parse(response.body)
    expect(ii_response["id"]).to be(invoice.id)

  end
end
