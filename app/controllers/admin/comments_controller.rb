class Admin::CommentsController < ApplicationController
    layout "admin"

    def index
        @students = Student.all
        @comments = Comment.by_student(params[:student_id])
    end

    def destroy
        @comment = Comment.find(params[:id])
        @course = Course.find(session[:course_id])
        @comment.destroy
        redirect_to admin_course_path(@course)
    end
end