class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.start_of_day(date)
    Date.parse(date).beginning_of_day
  end

  def self.end_of_day(date)
    Date.parse(date).end_of_day
  end
end
