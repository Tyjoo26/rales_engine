require 'csv'

namespace :import_csv do
  desc "Loads CSV into Database"
  task load: :environment do
    CSV.foreach('data/customers.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      Customer.create!(id: row[:id],
                      first_name: row[:first_name],
                      last_name: row[:last_name],
                      created_at: row[:created_at],
                      updated_at: row[:updated_at])
    end

    CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      Merchant.create!(id: row[:id],
        name: row[:name],
        created_at: row[:created_at],
        updated_at: row[:updated_at])
      end

    CSV.foreach('data/invoices.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      Invoice.create!(id: row[:id],
                      customer_id: row[:customer_id],
                      merchant_id: row[:merchant_id],
                      status: row[:status],
                      created_at: row[:created_at],
                      updated_at: row[:updated_at])
    end


    CSV.foreach('data/items.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      Item.create!(id: row[:id],
                  name: row[:name],
                  description: row[:description],
                  unit_price: row[:unit_price],
                  merchant_id: row[:merchant_id],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
    end

    CSV.foreach('data/transactions.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      Transaction.create!(id: row[:id],
                          invoice_id: row[:invoice_id],
                          credit_card_number: row[:credit_card_number],
                          credit_card_expiration_date: row[:credit_card_expiration_date],
                          result: row[:result],
                          created_at: row[:created_at],
                          updated_at: row[:updated_at])
    end

    CSV.foreach('data/invoice_items.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
      InvoiceItem.create!(id: row[:id],
        item_id: row[:item_id],
        invoice_id: row[:invoice_id],
        quantity: row[:quantity],
        unit_price: row[:unit_price],
        created_at: row[:created_at],
        updated_at: row[:updated_at])
    end
  end
end
