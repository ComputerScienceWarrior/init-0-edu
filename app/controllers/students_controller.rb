class StudentsController < ApplicationController
    layout "dashboard"
    before_action :find_student, only: [:edit, :update]
 
    def index
        redirect_to root_path
    end

    def show
        @student = Student.find_by_id(params[:id])
    end

    def new
        @student = Student.new
        if logged_in_student?
            redirect_to student_path(current_student)
        else
            render :layout => 'application'
        end
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @student.update(student_params)
        if @student.valid?
            redirect_to student_path(@student)
        else
            render :edit
        end

    end

    def destroy
        @student = Student.find_by_id(params[:id])

        if current_student.is_admin
            @student.comments.destroy_all
            @student.destroy 
            redirect_to students_path
        else
            @student.comments.destroy_all
            @student.destroy
            redirect_to root_path
        end
    end

    private

    def student_params
        params.require(:student).permit(:username, :password, :password_confirmation, :email)
    end

    def find_student
        @student = Student.find(session[:student_id])
    end

end