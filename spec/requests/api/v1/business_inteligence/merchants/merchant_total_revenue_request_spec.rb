describe "Revenue Business Intelligence Methods" do
  it "GET total revenue associated with specific merchant" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant: merchant)
    invoice = create(:invoice,customer:customer, merchant:merchant)
    create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice, item: item)
    create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    expect(total_revenue[:revenue]).to eq("8.00")

  end

  it "GET total revenue associated with specific merchant and date" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant: merchant)
    invoice = create(:invoice,customer:customer, merchant:merchant)
    create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice, item: item)
    create(:transaction, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{invoice.created_at}"

    expect(response).to be_success

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    expect(total_revenue[:revenue]).to eq("8.00")

  end

  it "EDGE TEST GET total revenue associated with specific merchant with another merchant available" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)


    invoice = create(:invoice, merchant:merchant_1)
    invoice_items = create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice)
    transaction = create(:transaction, invoice: invoice)

    invoice_2 = create(:invoice, merchant:merchant_2)
    invoice_items_2 = create_list(:invoice_item, 4, unit_price: 100, quantity: 4, invoice: invoice_2)
    transaction = create(:transaction, invoice: invoice_2)

    get "/api/v1/merchants/#{merchant_1.id}/revenue"

    expect(response).to be_success

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    expect(total_revenue[:revenue]).to eq("8.00")

  end
end
