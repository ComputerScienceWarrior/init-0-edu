class Admin::CommentsController < ApplicationController
    before_action :find_comment, only: [:index]
    before_action :require_admin
    layout "admin"

    def index
        @students = Student.all
        @comments_by_student = Comment.by_student(params[:student_id])
        @comments_by_course = Comment.by_course(params[:course_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :edited_at, :student_id, :course_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end