class Content < ApplicationRecord
validates :title, presence: true, length: { minimum: 6, maximum: 64 }
validates :description, presence: true
#validates :startDate, presence: true
#validates :endDate, presence: true
#validates :level, presence: true
#validates :user_id, presence: true
#validate :valid_start_date
#validate :valid_end_date
# Tam thoi tat cho nhanh nhe
belongs_to :user

private
def valid_start_date
  errors.add(:startDate, "In valid start date") if startDate < Date.today
end
def valid_end_date
  errors.add(:endDate, "In valid end date") if endDate < startDate
end
end
