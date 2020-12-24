class Admin::CommentsController < ApplicationController
    layout "admin"

    def index
        @students = Student.all
        @comments_by_student = Comment.by_student(params[:student_id])
        @comments_by_course = Comment.by_course(params[:course_id])
    end

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment
            redirect_to admin_course_path(@comment.course)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        if @comment
            redirect_to admin_course_path(@comment.course)
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @course = Course.find(session[:course_id])
        @comment.destroy
        redirect_to admin_course_path(@course)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :edited_at, :student_id, :course_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end