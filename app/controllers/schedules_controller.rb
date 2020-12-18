class SchedulesController < ApplicationController
    def index
        
    end
    def create
        @post = Post.new(name: params[:name])
        @post.save
        
        @post = Post.new(staretdate: params[:startdate])
        @post.save
        
        @post = Post.new(moemo: parms[:memo])
        @post.save
        redirect_to("")

    end
end

