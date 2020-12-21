class TopicsController < ApplicationController
    before_action :find_course_and_topic, only: [:show, :edit, :update, :destroy]
    before_action :render_dashboard, only: [:show, :edit]

    def index
        @topics = Topic.all
        @course = current_course
        render_dashboard
    end

    def show
    end

    def new
        if current_student.is_admin
            @topic = Topic.new
            render_dashboard
        else
            redirect_to student_path(current_student)
        end
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
        @topic.update(topic_params)
        if @topic
            redirect_to topic_path(@topic)
        else
            render :edit
        end
    end

    def destroy
        @topic.destroy
        redirect_to course_path(@course)
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