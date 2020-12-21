class Course < ApplicationRecord
    has_many :topics
    accepts_nested_attributes_for :topics
    has_many :students
    has_many :comments
    has_many :students, through: :comments
    validates_presence_of :title, :description
end
