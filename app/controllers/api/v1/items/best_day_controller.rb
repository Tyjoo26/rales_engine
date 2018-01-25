class Api::V1::Items::BestDayController < ApplicationController

  def show
    invoice = Invoice.best_day(params[:id])
    
    render json: {best_day: invoice.updated_at}
  end
end
