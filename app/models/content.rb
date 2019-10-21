class Content < ApplicationRecord

validates :title, presence: true, length: { minimum: 6, maximum: 64 }
validates :description, presence: true
validates :startDate, presence: true
validates :endDate, presence: true
validates :level, presence: true
validate :valid_start_date
validate :valid_end_date

belongs_to :user
belongs_to :group
has_many :attendances

private
  def valid_start_date
    errors.add(:startDate, "In valid start date") if startDate < Date.today
  end

  def valid_end_date
    errors.add(:endDate, "In valid end date") if endDate < startDate
  end
end
