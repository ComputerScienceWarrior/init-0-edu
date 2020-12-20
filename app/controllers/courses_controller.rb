class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :destroy]

    def index
        @courses = Course.all
        render_dashboard
    end

    def show
        set_course_session_id
        render_dashboard
    end

    def new
        @course = Course.new
        @course.topics.build
        render_dashboard
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
        render_dashboard
    end

    def update

    end

    def destroy
        @course.topics.destroy
        @course.destroy
        redirect_to courses_path
    end

    private

    def course_params
        params.require(:course).permit(:title, :description, :duration, :rating, topics_attributes: [:title, :description, :course_id])
    end

    def find_course
        @course = Course.find(params[:id])
    end

end