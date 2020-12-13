class Topic < ApplicationRecord
    belongs_to :course
    validates_presence_of :title, :description, :course_id
end
