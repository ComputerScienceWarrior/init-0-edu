class StudentsController < ApplicationController
    before_action :find_student, only: [:index, :show, :edit, :update, :destroy]

    def index
        #only an admin student can view the students page
        if @student.is_admin
            @students = Student.all
        else
            redirect_to student_path(@student)
        end
    end

    def show
        render_dashboard
    end

    def new
        @student = Student.new
        if logged_in_student?
            redirect_to student_path(current_student)
        end
    end

    def create
        @student = Student.create(student_params)
        if @student
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def edit
        render_dashboard
    end

    def update
        @student.update(student_params)
        redirect_to student_path(@student)
    end

    def destroy
        @student.destroy
        redirect_to root_path
    end

    private

    def student_params
        params.require(:student).permit(:firstname, :lastname, :username, :password, :password_confirmation, :email, :gpa)
    end

    def find_student
        @student = Student.find(session[:student_id])
    end

    def render_dashboard
        if @student.is_admin
            render :layout => "admin"
        else
            render :layout => "dashboard"
        end
    end

end