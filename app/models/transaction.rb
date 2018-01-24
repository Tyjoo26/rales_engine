class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: ["success", "failed"]

  scope :successful,     -> {where(result: 0)}
  scope :not_successful, -> {where(result: 1)}
  
end
