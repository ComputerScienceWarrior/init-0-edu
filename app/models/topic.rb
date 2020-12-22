class Topic < ApplicationRecord
    belongs_to :course
    validates_presence_of :title, :description

    def self.by_course(course_id)
        where(course: course_id)
    end
end
