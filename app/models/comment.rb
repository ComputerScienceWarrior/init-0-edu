class Comment < ApplicationRecord
    belongs_to :student
    belongs_to :course
    validates_presence_of :content, :student_id, :course_id
end