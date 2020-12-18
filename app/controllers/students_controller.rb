class StudentsController < ApplicationController
    before_action :find_student, only: [:index, :edit, :update]

    def index
        #only an admin student can view the students page
        if @student.is_admin
            @students = Student.all
            render_dashboard
        else
            redirect_to student_path(@student)
        end
    end

    def show
        @student = Student.find_by_id(params[:id])
        if current_student.is_admin
            render_dashboard
        else
            render_dashboard
        end
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
        @student = Student.find_by_id(params[:id])

        if current_student.is_admin
            @student.destroy 
            redirect_to students_path
        else
            @student.destroy
            redirect_to root_path
        end
    end

    private

    def student_params
        params.require(:student).permit(:firstname, :lastname, :username, :password, :password_confirmation, :email, :gpa)
    end

    def find_student
        @student = Student.find(session[:student_id])
    end

    def render_dashboard
        if current_student.is_admin
            render :layout => "admin"
        else
            render :layout => "dashboard"
        end
    end

end