class Topic < ApplicationRecord
    belongs_to :course
    validates_presence_of :title, :description, :course_id, message: "must be present to create a topic."
    has_many :videos
    def self.by_course(course_id)
        where(course: course_id)
    end
end
