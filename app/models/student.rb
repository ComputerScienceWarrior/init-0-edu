class Student < ApplicationRecord
    has_many :comments
    has_many :courses, through: :comments
    has_secure_password
    validates_presence_of :username, :email
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    validates :username, format: { without: /\s/, message: "cannot contain any spaces!" }
    validates :username, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
    validates :username, length: { minimum: 8 }
    validates :username, presence: true
 
    def self.from_omniauth(auth)
      # Creates a new student only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |student|
        student.username = "brandnewuser"
        student.email = auth.info.email
        student.password = auth.info.name
        student.is_admin = false
      end
    end

end
