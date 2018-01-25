require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "relationships" do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
    it {should have_many :invoices}
    it {should have_many :transactions}
  end

  describe "class methods" do
    context "::most_revenue(quantity)" do
      it "returns 1 item with most revenue" do
        item_1 = create(:item)
        item_2 = create(:item)
        create_list(:invoice_item, 10, item: item_1, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 10, item: item_2, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 5)

        items = Item.most_revenue(1)

        expect(items.length).to eq(1)
        expect(items.first).to eq(item_1)
      end

      it "returns 5 items with most revenue" do
        item_1 = create(:item)
        item_2 = create(:item)
        item_3 = create(:item)
        item_4 = create(:item)
        item_5 = create(:item)

        create_list(:invoice_item, 10, item: item_1, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 7, item: item_2, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 5, item: item_3, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 3, item: item_4, quantity: 5, unit_price: 15000)
        create_list(:invoice_item, 1, item: item_5, quantity: 5, unit_price: 15000)

        items = Item.most_revenue(5)

        expect(items.length).to eq(5)
        expect(items.first).to eq(item_1)
      end
    end
  end
end
