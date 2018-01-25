describe "Transaction Relations API" do
  context "GET :id/invoice" do
    it "returns the invoice for that transaction" do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice: invoice)

      get "/api/v1/transactions/#{transaction.id}/invoice"

      response_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(response_invoice["id"]).to eq(invoice.id)
    end
  end
end
