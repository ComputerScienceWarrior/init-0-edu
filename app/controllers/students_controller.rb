class StudentsController < ApplicationController
    before_action :find_student, only: [:edit, :update]
    before_action :authentication_required, only: [:index]

    def index
        #only an admin student can view the students page
        if current_student.is_admin
            @students = Student.all
            render_dashboard
        else
            redirect_to student_path(@student)
        end
    end
 
    def show
        @student = Student.find_by_id(params[:id])
        render_dashboard
    end

    def new
        @student = Student.new
        if logged_in_student?
            redirect_to student_path(current_student)
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
        render_dashboard
    end

    def update
        @student.update(student_params)
        if @student
            redirect_to student_path(@student)
        else
            render :edit
        end

    end

    def destroy
        @student = Student.find_by_id(params[:id])

        if current_student.is_admin
            @student.comments.destroy
            @student.destroy 
            redirect_to students_path
        else
            @student.comments.destroy
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