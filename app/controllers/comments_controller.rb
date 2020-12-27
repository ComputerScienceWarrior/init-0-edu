class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :destroy]
    layout "dashboard"

    def index
        @students = Student.all
        @comments = Comment.all
    end

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment
            redirect_to course_path(@comment.course)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to course_path(@comment.course)
        else
            render :edit
        end
    end

    def destroy
        @comment.destroy
        redirect_to student_path(current_student)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :edited_at, :student_id, :course_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end

end