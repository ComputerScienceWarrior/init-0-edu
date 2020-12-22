class Admin::CommentsController < ApplicationController

    def index
        @course = Course.find(params[:course_id])
        @students = Student.all
        @comments = Comment.by_course(@course)
        render_dashboard
    end

    def destroy
        @comment = Comment.find(params[:id])
        @course = Course.find(session[:course_id])
        @comment.destroy
        redirect_to course_path(@course)
    end
end