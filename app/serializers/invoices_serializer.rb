class InvoicesSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price
end
