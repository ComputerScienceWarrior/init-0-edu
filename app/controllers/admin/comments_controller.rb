class Admin::CommentsController < ApplicationController
    layout "admin"

    def index
        @course = Course.find(params[:course_id])
        @students = Student.all
        @comments = Comment.by_course(@course)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @course = Course.find(session[:course_id])
        @comment.destroy
        redirect_to admin_course_path(@course)
    end
end