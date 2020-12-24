class TopicsController < ApplicationController
    before_action :find_course_and_topic, only: [:index, :show]
    layout "dashboard"

    def index
        @all_topics = Topic.all
    end

    def show
        @topic = @topics_by_course.find(params[:id])
    end

    private

    def find_course_and_topic
        @course = Course.find(params[:course_id])
        @topics_by_course = Topic.by_course(@course)
    end

end