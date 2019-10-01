class Group < ApplicationRecord
    validates :name,        presence: true, length: { maximum: 64   }
    validates :decription,  presence: true,  length: { maximum: 255  }  
    validates :startdate, presence: true

    belongs_to :course

    scope :running_by_course, -> (course_id) {
      where(course_id: course_id).where("startdate <= ?", Date.today)
    }

    scope :comming_by_course, ->(course_id) {
      where(course_id: course_id).where("startdate > ?", Date.today)
    }

    private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
end
