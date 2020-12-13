class TeachersController < ApplicationController
    before_action :find_teacher, only: [:show, :edit, :delete]

    def index
        @teachers = Teacher.all
    end

    def show
    end

    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.create(teacher_params)
        if @teacher
            redirect_to teacher_path(@teacher)
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

    def teacher_params
        params.require(:teacher).permit(:firstname, :lastname, :username, :email, :password_digest, :room_no)
    end

    def find_teacher
        @teacher = Teacher.find(params[:id])
    end

end