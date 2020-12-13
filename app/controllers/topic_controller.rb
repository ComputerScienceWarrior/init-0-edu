class CourseController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :delete]

    def index
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
            redirect_to comment_path(@comment)
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

    def topic_params
        params.require(:topic).permit(:content, :edited_at, :student_id, :course_id)
    end

    def find_topic
        @topic = Topic.find(params[:id])
    end

end