class SessionsController < ApplicationController
    def new_student
        @student = Student.new
    end

    def student_login
        @student =  Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            redirect_to '/login'
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

end
