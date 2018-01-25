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
      before(:each) do
        @merchants = create_list(:merchant, 3)
        invoice = create(:invoice, merchant: @merchants.first)
        transaction = create(:transaction, invoice: invoice)
        invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 2)

        invoice = create(:invoice, merchant: @merchants.second)
        transaction = create(:transaction, invoice: invoice)
        invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 4)

        invoice = create(:invoice, merchant: @merchants.third)
        transaction = create(:transaction, invoice: invoice)
        invoice_items = create_list(:invoice_item, 5, invoice: invoice, quantity: 6)

      end

      it "returns top 1 merchants by item sold" do
        top_merchants = Invoice.most_items_sold(1)

        expect(top_merchants.first.id).to eq(@merchants.last.id)
      end

      it "returns top 3 merchants by item sold" do
        top_merchants = Invoice.most_items_sold(3)

        expect(top_merchants.first.id).to eq(@merchants.last.id)
        expect(top_merchants.last.id).to eq(@merchants.first.id)
      end
    end

    context "::best_day(id)" do
      it "returns a single items best day" do
        item = create(:item)
        invoice_list = create_list(:invoice, 5)
        ii_list = create_list(:invoice_item, 5, invoice: invoice_list.first, item: item)
        transaction_list = create_list(:transaction, 5, invoice: invoice_list.first)
        invoice_list = create_list(:invoice, 2, updated_at: "2012-03-02T16:54:31.000Z")
        ii_list = create_list(:invoice_item, 2, invoice: invoice_list.first, item: item)
        transaction_list = create_list(:transaction, 5, invoice: invoice_list.first)

        best_day = Invoice.best_day(item.id)

        expect(best_day.created_at).to eq("2012-03-06T16:54:31.000Z")
      end
    end
  end
end
