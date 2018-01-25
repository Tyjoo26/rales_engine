require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it {should belong_to :customer}
    it {should belong_to :merchant}
    it {should have_many :transactions}
    it {should have_many :invoice_items}
    it {should have_many :items}
  end

  describe "class methods" do
    context "::merchants_total_revenue(date)" do
      it "only returns total revenue for date" do
        created_date = "2012-03-16"
        other_date = "2012-03-17"
        merchant = create(:merchant)
        successful_1 = create(:transaction, result: 0)
        successful_2 = create(:transaction, result: 0)
        invoice_1 = create(:invoice, merchant: merchant, transactions: [successful_1], updated_at: created_date)
        invoice_2 = create(:invoice, merchant: merchant, transactions: [successful_2], updated_at: other_date)
        create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_1)
        create_list(:invoice_item, 5, quantity: 1, unit_price: 10, invoice: invoice_2)

        total_revenue = Invoice.merchants_total_revenue(created_date)

        expect(total_revenue).to eq(50)
      end
    end

    context "::merchant_total_revenue_by_date(date, id)" do
      it "returns total revenue for merchant on date" do
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice_1 = create(:invoice,customer:customer, merchant:merchant)
        create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice_1, item: item)
        create(:transaction, invoice: invoice_1)
        invoice = create(:invoice,customer:customer, merchant:merchant, created_at: Date.today, updated_at: Date.today)
        create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice, item: item)
        create(:transaction, invoice: invoice)

        total_revenue = Invoice.merchant_total_revenue_by_date(invoice_1.created_at.to_s, merchant.id)

        expect(total_revenue).to eq(800)
      end
    end

    context "::merchant_total_revenue(id)" do
      it "returns total revenue for merchant" do
        merchant = create(:merchant)
        customer = create(:customer)
        item = create(:item, merchant: merchant)
        invoice = create(:invoice,customer:customer, merchant:merchant)
        create_list(:invoice_item, 4, unit_price: 200, quantity: 1, invoice: invoice, item: item)
        create(:transaction, invoice: invoice)

        total_revenue = Invoice.merchant_total_revenue(merchant.id)

        expect(total_revenue).to eq(800)

      end
    end

    context "::most_items_sold(quantity)" do
      it "returns " do

      end
    end

    context "::best_day(id)" do

    end
  end
end
