
describe "Customers API" do
  context "HTTP GET REQUEST" do
    it "sends a list of customers" do
      customers = create_list(:customer, 4)

      get '/api/v1/customers'

      expect(response).to be_success

      customer_list = JSON.parse(response.body)

      expect(customer_list.count).to eq(4)
    end

    it "sends a single customer " do
      customer_id = create(:customer).id

      get "/api/v1/customers/#{customer_id}"

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:id]).to eq(customer_id)
    end
  end
end
