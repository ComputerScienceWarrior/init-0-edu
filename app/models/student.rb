class Student < ApplicationRecord
    has_many :courses, through: :comments
    has_many :comments, through: :courses
    has_many :comments
    has_secure_password
    validates_presence_of :firstname, :lastname, :username, :email
    validates :username, uniqueness: true
    validates :email, uniqueness: true
end
