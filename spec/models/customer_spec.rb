require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it {should have_many :invoices}
    it {should have_many :transactions}
    it {should have_many :merchants}
  end

  describe "class methods" do
    context "::favorite_customer(merchant)" do
      it "returns a merchants favorite customer" do
        customer_1 = create(:customer)
        customer_2 = create(:customer)
        customer_3 = create(:customer)
        merchant = create(:merchant)
        create_list(:invoice, 5, customer: customer_1, merchant: merchant, transactions: [create(:transaction)])
        create_list(:invoice, 2, customer: customer_2, merchant: merchant, transactions: [create(:transaction)])
        create_list(:invoice, 1, customer: customer_3, merchant: merchant, transactions: [create(:transaction)])

        favorite_customer = Customer.favorite_customer(merchant.id)

        expect(favorite_customer.id).to eq(customer_1.id)
      end
    end

    context "::customers_with_pending_invoices(merchant)" do
      it "returns only customers without successful transactions" do
        merchant = create(:merchant)
        customer_1 = create(:customer)
        invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
        create(:transaction, result: 1, invoice: invoice_1)

        customer_2 = create(:customer)
        invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)
        create(:transaction, result: 1, invoice: invoice_2)
        create(:transaction, result: 0, invoice: invoice_2)

        customer_3 = create(:customer)
        invoice_3 = create(:invoice, customer: customer_3, merchant: merchant)
        create(:transaction, result: 1, invoice: invoice_3)

        customer_4 = create(:customer)
        invoice_4 = create(:invoice, customer: customer_4, merchant: merchant)
        create(:transaction, result: 0, invoice: invoice_4)

        customers = Customer.customers_with_pending_invoices(merchant.id)

        expect(customers.first.id).to eq(customer_1.id)
        expect(customers.last.id).to eq(customer_3.id)
        expect(customers.include?(customer_2)).to be_falsy
        expect(customers.include?(customer_4)).to be_falsy

      end
    end
  end
end
