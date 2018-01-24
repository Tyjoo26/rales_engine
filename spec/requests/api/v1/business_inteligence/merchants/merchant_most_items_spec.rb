describe "GET top x merchants ranked by total number of items sold" do
  it "returns top 1 merchants" do
    merchant = create_list(:merchant, 3).first
    invoice = create(:invoice, merchant: merchant)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 2)

    get "/api/v1/merchants/most_items?quantity=1"

    merchant_response = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_success
    expect(merchant_response.count).to eq(1)
    expect(merchant_response.first[:id]).to eq(merchant.id)
  end

  it "returns top 3 merchants" do
    merchants = create_list(:merchant, 3)
    invoice = create(:invoice, merchant: merchants.first)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 2)

    invoice = create(:invoice, merchant: merchants.second)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 4)

    invoice = create(:invoice, merchant: merchants.third)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 6)

    get "/api/v1/merchants/most_items?quantity=3"

    merchant_response = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_success
    expect(merchant_response.count).to eq(3)
    expect(merchant_response.first[:id]).to eq(merchants.third.id)
    expect(merchant_response.last[:id]).to eq(merchants.first.id)
  end

  it "returns top 2 merchants with same quantity" do
    merchants = create_list(:merchant, 3)
    invoice = create(:invoice, merchant: merchants.first)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 2)

    invoice = create(:invoice, merchant: merchants.second)
    invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 2)


    get "/api/v1/merchants/most_items?quantity=2"

    merchant_response = JSON.parse(response.body, symbolize_names:true)

    expect(response).to be_success
    expect(merchant_response.count).to eq(2)
    expect(merchant_response.first[:id]).to eq(merchants.first.id)
    expect(merchant_response.last[:id]).to eq(merchants.second.id)
  end
end
