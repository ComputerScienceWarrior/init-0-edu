class Course < ApplicationRecord
    has_many :topics
    accepts_nested_attributes_for :topics
    has_many :students, through: :comments
    has_many :comments, through: :students
    validates_presence_of :title, :description
end
