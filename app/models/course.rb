class Course < ApplicationRecord
    has_many :topics
    accepts_nested_attributes_for :topics
    has_many :students, through: :comments
    has_many :comments, through: :students
    belongs_to :teacher
    validates_presence_of :title, :description, :teacher_id
end
