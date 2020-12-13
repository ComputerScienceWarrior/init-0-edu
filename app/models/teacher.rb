class Teacher < ApplicationRecord
    has_many :students, through: :courses
    has_many :courses
    has_secure_password
    validates_presence_of :firstname, :lastname, :username, :password, :email
end
