class VideosController < ApplicationController
    before_action :find_video, only: [:show]
    layout "dashboard"

    def index
        @videos = Video.all
    end

    def show
    end
 
    private

    def video_params
        params.require(:video).permit(:title, :caption, :url, :topic_id)
    end

    def find_video
        @video = Video.find(params[:id])
    end

end