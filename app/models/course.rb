class Course < ApplicationRecord
    has_many :students, through: :comments
    has_many :comments, through: :students
    has_many :topics
    belongs_to :teacher
    validates_presence_of :title, :description, :teacher_id
end
