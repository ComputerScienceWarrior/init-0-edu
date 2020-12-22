class Admin::StudentsController < ApplicationController
    before_action :authentication_required, only: [:index]

    def index
        @students = Student.all
        render_dashboard
    end

    def destroy
        @student = Student.find_by_id(params[:id])
        @student.comments.destroy
        @student.destroy 
        redirect_to students_path
    end

    private

    def student_params
        params.require(:student).permit(:username, :password, :password_confirmation, :email)
    end

    def find_student
        @student = Student.find(session[:student_id])
    end

end