require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do
    it {should have_many :invoices}
    it {should have_many :transactions}
    it {should have_many :customers}
    it {should have_many :items}
    it {should have_many :invoice_items}
  end

  describe "class methods" do
    context "::most_revenue(quantity)" do
      before(:each) do
        @merchant_1 = create(:merchant)
        item_1 = create(:item, merchant: @merchant_1)
        invoice_1 = create(:invoice, merchant: @merchant_1)
        create(:transaction, invoice: invoice_1, result: "success")
        create_list(:invoice_item, 5, item: item_1, invoice: invoice_1, quantity: 5, unit_price: 100)

        @merchant_2 = create(:merchant)
        item_2 = create(:item, merchant: @merchant_2)
        invoice_2 = create(:invoice, merchant: @merchant_2)
        create(:transaction, invoice: invoice_2, result: "success")
        create_list(:invoice_item, 5, item: item_2, invoice: invoice_2, quantity: 4, unit_price: 100)

        @merchant_3 = create(:merchant)
        item_3 = create(:item, merchant: @merchant_3)
        invoice_3 = create(:invoice, merchant: @merchant_3)
        create(:transaction, invoice: invoice_3, result: "success")
        create_list(:invoice_item, 5, item: item_3, invoice: invoice_3, quantity: 3, unit_price: 100)

        merchant_4 = create(:merchant)
        item_4 = create(:item, merchant: merchant_4)
        invoice_4 = create(:invoice, merchant: merchant_4)
        create(:transaction, invoice: invoice_4, result: "success")
        create_list(:invoice_item, 5, item: item_4, invoice: invoice_4, quantity: 2, unit_price: 100)

        merchant_5 = create(:merchant)
        item_5 = create(:item, merchant: merchant_5)
        invoice_5 = create(:invoice, merchant: merchant_5)
        create(:transaction, invoice: invoice_5, result: "success")
        create_list(:invoice_item, 5, item: item_5, invoice: invoice_5, quantity: 1, unit_price: 100)

      end

      it "returns 1 merchant" do
        top_1_merchants = Merchant.most_revenue(1)

        expect(top_1_merchants.length).to eq(1)
        expect(top_1_merchants.first).to eq(@merchant_1)
      end

      it "returns 3 merchants" do
        top_3_merchants = Merchant.most_revenue(3)

        expect(top_3_merchants.length).to eq(3)
        expect(top_3_merchants.first).to eq(@merchant_1)
        expect(top_3_merchants.last).to eq(@merchant_3)
      end
    end

    context "::customer_favorite_merchant(id)" do
      it "returns a customers favorite merchant" do
        customer = create(:customer)
        favorite_merchant = create_list(:merchant, 5).first
        invoice_list = create_list(:invoice, 5, customer:customer, merchant: favorite_merchant)
        create_list(:transaction, 10, invoice:invoice_list.first)

        customer_2 = create(:customer)
        merchant_list_2 = create_list(:merchant, 5)
        invoice_list_2 = create_list(:invoice, 5, customer:customer_2, merchant:merchant_list_2.first)
        create_list(:transaction, 10, invoice:invoice_list_2.first)

        favorite_merchant = Merchant.customer_favorite_merchant(customer.id)

        expect(favorite_merchant).to eq(favorite_merchant)
      end
    end
  end
end
