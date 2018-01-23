
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

  context "It GETS first customer with" do
    it "id" do
      customer = create_list(:customer, 5).first

      get "/api/v1/customers/find?id=#{customer.id}"

      customer_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success

      expect(customer_response[:id]).to eq(customer.id)
    end

    it "first_name" do
      customer = create_list(:customer, 5).first

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      customer_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(customer_response[:first_name]).to eq(customer.first_name)
    end

    it 'last name' do
      customer = create_list(:customer, 5).first

      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      customer_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(customer_response[:last_name]).to eq(customer.last_name)
    end

    it "created_at" do
      customer = create_list(:customer, 5).first

      get "/api/v1/customers/find?created_at=#{customer.created_at}"
      customer_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(customer_response[:id]).to eq(customer.id)
    end

    it "updated_at" do
      customer = create_list(:customer, 5).first

      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"
      customer_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(customer_response[:id]).to eq(customer.id)
    end
  end
end
