
describe "Customer Search JSON QUERY" do
  context "HTTP GET REQUESTS BY PARAMETERS" do
    it "displays a specific customer based on passing a name query" do
      first_name = create(:customer).first_name

      get "/api/v1/customers/find?name=#{first_name}"

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:first_name]).to eq(first_name)
    end

    it "displays a specific customer based on passing a id query" do
      id = create(:customer).id

      get "/api/v1/customers/find?id=#{id}"

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:id]).to eq(id)
    end

    xit "displays a specific customer based on passing a created_at query" do
      created_at = create(:customer).created_at

      get "/api/v1/customers/find?created_at=#{created_at}"

      expect(response).to be_success

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:created_at]).to eq(created_at)
    end
  end
end
