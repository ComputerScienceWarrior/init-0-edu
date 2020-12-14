class StaticController < ApplicationController
    def home
        @courses = Course.all
    end
end