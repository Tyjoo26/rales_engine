describe "HTTP request for best day for certain item" do
  it "displays the date with most sales for given item using invoice date" do
    item = create(:item)
    invoice_list = create_list(:invoice, 5)
    ii_list = create_list(:invoice_item, 5, invoice: invoice_list.first, item: item)
    transaction_list = create_list(:transaction, 5, invoice: invoice_list.first)
    invoice_list = create_list(:invoice, 2, updated_at: "2012-03-02T16:54:31.000Z")
    ii_list = create_list(:invoice_item, 2, invoice: invoice_list.first, item: item)
    transaction_list = create_list(:transaction, 5, invoice: invoice_list.first)


    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success
    invoice_response = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_response[:best_day]).to eq("2012-03-06T16:54:31.000Z")
  end


end
