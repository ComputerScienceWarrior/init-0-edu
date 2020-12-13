class CourseController < ApplicationController
    before_action :find_course, only: [:show, :edit, :delete]

    def index
        @courses = Course.all
    end

    def show
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.create(course_params)
        if @course
            redirect_to course_path(@course)
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

    def course_params
        params.require(:course).permit(:title, :description, :duration, :rating, :teacher_id)
    end

    def find_course
        @course = Course.find(params[:id])
    end

end