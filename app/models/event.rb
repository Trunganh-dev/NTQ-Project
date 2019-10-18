class Event < ApplicationRecord
  validates :title, presence: true
  validates :startDate, presence: true
  validates :endDate, presence: true
end
