class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :edit, :delete]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params)
        if @student
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def edit
        
    end

    def update

    end

    def delete

    end

    private

    def student_params
        params.require(:student).permit(:firstname, :lastname, :username, :password, :password_confirmation, :email, :gpa)
    end

    def find_student
        @student = Student.find(params[:id])
    end

end