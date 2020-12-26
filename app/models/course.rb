class Course < ApplicationRecord
    has_many :topics
    accepts_nested_attributes_for :topics
    has_many :students
    has_many :comments
    has_many :students, through: :comments
    validates_presence_of :title, :description
    validates :description, length: {minimum: 10, message: "must have at least 10 words."}

    def course_name
        self.title
    end
end
