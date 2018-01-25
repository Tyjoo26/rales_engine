describe "Customer Relations API" do
  context "GET :id/invoices" do
    it "returns invoices associated with specific customer" do
      customer = create(:customer)
      invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, customer: customer)

      get "/api/v1/customers/#{customer.id}/invoices"

      invoices_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices_response.count).to eq(3)
      expect(invoices_response[0]["id"]).to eq(invoice_1.id)
      expect(invoices_response[1]["id"]).to eq(invoice_2.id)
      expect(invoices_response[2]["id"]).to eq(invoice_3.id)
    end
  end

  context "GET :id/transactions" do
    it "returns transactions associated with specific customer" do
      customer = create(:customer)
      invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, customer: customer)
      transaction_1 = create(:transaction, invoice: invoice_1)
      transaction_2 = create(:transaction, invoice: invoice_2)
      transaction_3 = create(:transaction, invoice: invoice_3)


      get "/api/v1/customers/#{customer.id}/transactions"

      transactions_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions_response.count).to eq(3)
      expect(transactions_response[0]["id"]).to eq(transaction_1.id)
      expect(transactions_response[1]["id"]).to eq(transaction_2.id)
      expect(transactions_response[2]["id"]).to eq(transaction_3.id)
    end
  end
end
