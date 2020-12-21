class Student < ApplicationRecord
    has_many :courses, through: :comments
    has_many :comments, through: :courses
    has_many :comments
    has_secure_password
    validates_presence_of :username, :email
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :username, format: { without: /\s/, message: "cannot contain any spaces!" }
    validates :username, presence: true, length: { minimum: 10, message: "must be at least 10 characters." }
 
    def self.from_omniauth(auth)
      # Creates a new student only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |student|
        student.username = auth.info.name.strip
        student.email = auth.info.email
        student.password = auth.info.name
        student.is_admin = false
      end
    end

end
