class Admin::VideosController < ApplicationController
    before_action :require_admin
    before_action :find_video, only: [:show, :edit, :update, :destroy]
    layout "admin"

    def index
        @videos = Video.by_topic(params[:topic_id])
    end

    def show
    end

    def new
        @video = Video.new
    end

    def create
        @video = Video.new(video_params)
        if @video.save
            redirect_to admin_topic_path(@video.topic)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @video.update(video_params)
        if @video.valid?
            redirect_to admin_topic_path(@video.topic)
        else
            render :edit
        end
    end

    def destroy
        topic = @video.topic
        @video.destroy
        redirect_to admin_topic_videos_path(topic)
    end
 
    private

    def video_params
        params.require(:video).permit(:title, :caption, :url, :topic_id)
    end

    def find_video
        @video = Video.find(params[:id])
    end

end