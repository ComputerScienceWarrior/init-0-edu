class Admin::CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    layout "admin"

    def index
        @courses = Course.all
    end

    def show
    end

    def new
        @course = Course.new
        @course.topics.build
    end

    def create
        @course = Course.create(course_params)
        if @course
            redirect_to admin_course_path(@course)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @course.update(course_params)
        if @course
            redirect_to admin_course_path(@course)
        else
            render :edit
        end
    end

    def destroy
        @course.topics.destroy
        @course.destroy
        redirect_to admin_courses_path
    end

    private

    def course_params
        params.require(:course).permit(:title, :description, :duration, :rating, topics_attributes: [:title, :description, :course_id])
    end

    def find_course
        @course = Course.find(params[:id])
    end

end