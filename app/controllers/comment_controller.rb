class CourseController < ApplicationController
    before_action :find_student, only: [:show, :edit, :delete]

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

    def comment_params
        params.require(:comment).permit(:title, :description, :duration, :rating, :teacher_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end

end