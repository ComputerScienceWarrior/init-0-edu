class Course < ApplicationRecord
    has_many :topics
    accepts_nested_attributes_for :topics
    has_many :students
    has_many :comments
    has_many :students, through: :comments
    has_many :videos, through: :topics
    validates_presence_of :title, :description, message: "for a course cannot be empty."
    validates :description, length: {minimum: 10, message: "for a course must have at least 10 words."}

    def course_name
        self.title
    end
end
