class Content < ApplicationRecord
validates :title, presence: true, length: { minimum: 6, maximum: 64 }
validates :description, presence: true
validates :startDate, presence: true
validates :endDate, presence: true
#validates :user_id, presence: true
validate :valid_start_date
validate :valid_end_date
# validates :start_date, date: { before: :Date.today}
# validates :end_time, date: {after: :start_time}
has_many :contents

private
def valid_start_date
  errors.add(:startDate, "In valid") if startDate < Date.today
end
def valid_end_date
  errors .add(:endDate, "In valid") if endDate < startDate
end
end
