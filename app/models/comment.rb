class Comment < ApplicationRecord
    belongs_to :student
    belongs_to :course
    validates_presence_of :content, :student_id, :course_id

    def self.by_course(course_id)
        where(course: course_id)
    end
end