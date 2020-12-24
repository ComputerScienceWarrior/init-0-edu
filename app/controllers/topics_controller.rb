class TopicsController < ApplicationController
    before_action :find_course_and_topic, only: [:show]
    layout "dashboard"

    def index
        @topics = Topic.by_course(params[:course_id])
    end

    def show
    end

    private

    def find_course_and_topic
        @topic = Topic.find(params[:id])
        @course = @topic.course
    end

end