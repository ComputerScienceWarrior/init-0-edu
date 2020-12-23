class Admin::StudentsController < ApplicationController
    before_action :authentication_required, only: [:index]
    layout "admin"

    def index
        @students = Student.all
    end

    def destroy
        @student = Student.find_by_id(params[:id])
        @student.comments.destroy
        @student.destroy 
        redirect_to admin_students_path
    end

    private

    def student_params
        params.require(:student).permit(:username, :password, :password_confirmation, :email)
    end

    def find_student
        @student = Student.find(session[:student_id])
    end

end