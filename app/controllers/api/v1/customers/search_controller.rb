class Api::V1::Customers::SearchController < ApplicationController
  def show
    if params[:first_name]
      customer = Customer.where("first_name LIKE ?", "%#{params[:first_name]}%").first
    elsif params[:last_name]
      customer = Customer.where("last_name LIKE ?", "%#{params[:last_name]}%").first
    else
      customer = Customer.where(customer_params).first
    end
    render json: customer
  end

  def index
    if params[:first_name]
      customers =  Customer.where("first_name LIKE ?", "%#{params[:first_name]}%")
    elsif params[:last_name]
      customers =  Customer.where("last_name LIKE ?", "%#{params[:last_name]}%")
    else
      customers = Customer.where(customer_params)
    end
    render json: customers
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
