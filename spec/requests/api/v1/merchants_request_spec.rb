
describe "Merchants API" do
  context "HTTP GET REQUESTS" do
    it "sends a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_success

      items = JSON.parse(response.body)
      expect(items.count).to eq(3)
    end

    it "sends a specific merchant" do
      id = create(:merchant).id


      get "/api/v1/merchants/#{id}"
      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(item[:name]).to eq("Mile High Dispensary")
      expect(item[:id]).to eq(id)
    end
  end

  context "FIND QUERY" do
    it "can find a merchant by id" do
      merchant = create_list(:merchant, 5).first

      get "/api/v1/merchants/find?id=#{merchant.id}"

      merchant_response = JSON.parse(response.body, symbolize_names:true )

      expect(response).to be_success
      expect(merchant_response[:id]).to eq(merchant.id)
    end

    it "can find a merchant by name" do
      merchant = create_list(:merchant, 5).first

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchant_response = JSON.parse(response.body, symbolize_names:true )

      expect(response).to be_success
      expect(merchant_response[:name]).to eq(merchant.name)
    end

    it "can find a merchant by created_at" do
      merchant = create_list(:merchant, 5).first

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      merchant_response = JSON.parse(response.body, symbolize_names:true )

      expect(response).to be_success
      expect(merchant_response[:id]).to eq(merchant.id)
    end

    it "can find a merchant by updated_at" do
      merchant = create_list(:merchant, 5).first

      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      merchant_response = JSON.parse(response.body, symbolize_names:true )

      expect(response).to be_success
      expect(merchant_response[:id]).to eq(merchant.id)
    end
  end

  context "FIND ALL QUERY" do
    it "with id" do
      create_list(:merchant, 4)
      merchant = create_list(:merchant,5).first

      get "/api/v1/merchants/find_all?id=#{merchant.id}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response.count).to eq(1)
    end

    it "with name" do
      create_list(:merchant, 4)
      merchant = create(:merchant,name: "TYJ")

      get "/api/v1/merchants/find_all?name=#{merchant.name}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response.count).to eq(1)
    end

    it "with created_at" do
      merchant = create_list(:merchant, 4,created_at: DateTime.yesterday).first


      get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response.count).to eq(4)
    end
  end
end
