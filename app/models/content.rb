class Content < ApplicationRecord
validates :title, presence: true, length: { minimum: 6, maximum: 64 }
validates :description, presence: true
validates :startDate, presence: true
validates :endDate, presence: true
# validates :start_date, date: { before: :Date.today}
# validates :end_time, date: {after: :start_time}


end
