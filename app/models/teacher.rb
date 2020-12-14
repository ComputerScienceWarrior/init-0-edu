class Teacher < ApplicationRecord
    has_many :students, through: :courses
    has_many :courses
    has_secure_password
    validates_presence_of :firstname, :lastname, :username, :email
    validates :username, uniqueness: true
    validates :email, uniqueness: true
end
