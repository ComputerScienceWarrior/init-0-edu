class SessionsController < ApplicationController
    def new_student
        @student = Student.new
    end

    def create_student
        @student =  Student.find_by(username: params[:username])
        if @student
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            redirect_to '/login'
        end
    end

    private 

    def student_login_params
        params.require(:student).permit(:firstname, :lastname, :username, :password, :email)
    end
end
