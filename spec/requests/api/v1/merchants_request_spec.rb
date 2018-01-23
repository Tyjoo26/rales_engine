
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
end
