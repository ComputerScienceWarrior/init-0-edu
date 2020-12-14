class TopicsController < ApplicationController
    before_action :find_course_and_topic, only: [:show, :edit, :delete]

    def index
        @topics = Topic.all
    end

    def show
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.create(topic_params)
        if @topic
            redirect_to topic_path(@topic)
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
        params.require(:topic).permit(:title, :description, :course_id)
    end

    def find_course_and_topic
        @topic = Topic.find(params[:id])
        @course = @topic.course
    end

end