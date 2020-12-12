class Course < ApplicationRecord
    has_many :students, through: :comments
    has_many :comments, through: :students
    belongs_to :teacher
    belongs_to :subject
    validates_presence_of :title, :description, :teacher_id,  :subject_id
end
