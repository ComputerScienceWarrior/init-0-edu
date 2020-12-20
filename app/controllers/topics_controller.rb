class TopicsController < ApplicationController
    before_action :find_course_and_topic, only: [:show, :edit, :update, :destroy]

    def index
        @topics = Topic.all
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
        render_dashboard
    end

    def update
        @topic.update(topic_params)
        if @topic
            redirect_to topic_path(@topic)
        else
            render :edit
        end
    end
    git commit -m "Create destroy action and add logic to destroy Topic. Add update action logic. render proper dashboards for new topic form. Update before action from :delete to :destroy."
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