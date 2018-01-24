class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:date] == nil
      merchant = Invoice.joins(:transactions).joins(:invoice_items).merge(Transaction.successful).where(merchant_id: params[:id]).sum("invoice_items.unit_price * invoice_items.quantity")
    else
      merchant = Invoice.joins(:transactions).joins(:invoice_items).where(transactions: {result: 0}).where(merchant_id: params[:id]).where().sum("invoice_items.unit_price * invoice_items.quantity")
    end
    render json: {"revenue" => revenue_in_dollars(merchant)}
  end

end


Merchant.find(27).transactions.where(result: "0").map {|transaction| InvoiceItem.where(invoice_id: transaction.invoice_id)}.flatten.map {|invoiceitem| invoiceitem.unit_price * invoiceitem.quantity}.sum
