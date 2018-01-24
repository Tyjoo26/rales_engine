
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

  context "Find queries" do
    it "finds a customer by id" do
      customer_id = create(:customer).id

      get "/api/v1/customers/find?id=#{customer_id}"

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names:true)

      expect(customer[:id]).to eq(customer_id)
    end

    it "finds a customer by first_name" do
      customer = create(:customer)

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response[:first_name]).to eq(customer.first_name)
    end

    it "finds a customer by last_name" do
      customer = create(:customer)

      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response[:last_name]).to eq(customer.last_name)
    end

    it "finds a customer by created_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?created_at=#{customer.created_at}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response[:id]).to eq(customer.id)
    end

    it "finds a customer by updated_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response[:id]).to eq(customer.id)
    end
  end

  context "find all queries" do
    it "finds all customers by id" do
      customers = create_list(:customer, 4)
      customer_id = create(:customer).id

      get "/api/v1/customers/find_all?id=#{customer_id}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response.count).to eq(1)
    end

    it "finds all customers by first_name" do
      customer = create_list(:customer, 4).first


      get "/api/v1/customers/find_all?first_name=#{customer.first_name}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response.count).to eq(4)
    end

    it "finds all customers by last_name" do
      customer = create_list(:customer, 4).first


      get "/api/v1/customers/find_all?last_name=#{customer.last_name}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response.count).to eq(4)
    end

    it "finds all customers by created_at" do
      customer = create_list(:customer, 4)
      customer_1 = create(:customer)

      get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response.count).to eq(5)
    end

    it "finds all customers by updated_at" do
      customer = create_list(:customer, 4)
      customer_1 = create(:customer, updated_at: DateTime.yesterday)

      get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}"

      expect(response).to be_success

      customer_response = JSON.parse(response.body, symbolize_names:true)

      expect(customer_response.count).to eq(1)
    end
  end
end
