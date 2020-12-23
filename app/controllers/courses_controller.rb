class CoursesController < ApplicationController
    before_action :find_course, only: [:show]
    layout "dashboard"

    def index
        @courses = Course.all
    end

    def show
        set_course_session_id
    end

    private

    def find_course
        @course = Course.find(params[:id])
    end

end