class Api::V1::Items::SearchController < Api::V1::BaseSearchController
  def show
    render json: Item.where(search(params)).first
  end

  def index
    render json: Item.where(search(params))
  end
end
