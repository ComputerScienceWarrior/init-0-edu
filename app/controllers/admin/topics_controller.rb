class Admin::TopicsController < ApplicationController
    before_action :require_admin
    before_action :find_course_and_topic, only: [:show, :edit, :update, :destroy]
    layout "admin"

    def index
        @topics_by_course = Topic.by_course(params[:course_id])
    end

    def show
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new(topic_params)
        @topic.course_id = params[:course_id]
        if @topic.save
            redirect_to admin_course_topics_path(@topic.course)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @topic.update(topic_params)
        if @topic.valid?
            redirect_to admin_topic_path(@topic)
        else
            render :edit
        end
    end

    def destroy
        @topic.videos.destroy_all
        @topic.destroy
        redirect_to admin_course_topics_path(@course)
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