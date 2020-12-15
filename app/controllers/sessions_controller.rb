class SessionsController < ApplicationController
    def new_student
        @student = Student.new
    end

    def create_student
        binding.pry
    end

    private 

    def student_login_params
        params.require(:student).permit(:firstname, :lastname, :username, :password, :email)
    end
end
