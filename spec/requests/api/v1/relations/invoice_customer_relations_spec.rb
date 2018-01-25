describe "HTTP Request invoice relations" do
  it "displays collection of customers associated with  specific invoice" do
    customer = create_list(:customer, 5)
    invoice = create(:invoice, customer: customer.first)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_success

    item_response = JSON.parse(response.body)

    expect(item_response["id"]).to eq(customer.first.id)
    
  end
end
