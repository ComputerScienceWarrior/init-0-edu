class Admin::StudentsController < ApplicationController
    before_action :authentication_required, only: [:index]
    before_action :find_student, only: [:show, :edit, :update, :destroy]
    before_action :require_admin
    layout "admin"

    def index
        @students = Student.all
    end

    def show
    end

    def edit
    end

    def update
        @student.update(student_params)
        if @student.valid?
            redirect_to admin_student_path(@student)
        else
            render :edit
        end

    end

    def destroy
        @student.comments.destroy_all
        @student.destroy 
        redirect_to admin_students_path
    end

    private

    def student_params
        params.require(:student).permit(:username, :password, :password_confirmation, :email)
    end

    def find_student
        @student = Student.find(params[:id])
    end

end