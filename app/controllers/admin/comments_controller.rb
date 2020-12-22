class CommentsController < ApplicationController

    def index
        @students = Student.all
        @comments = Comment.all
        render_dashboard
    end

    def destroy
        @comment = Comment.find(params[:id])
        @course = Course.find(session[:course_id])
        @comment.destroy
        redirect_to course_path(@course)
    end
end