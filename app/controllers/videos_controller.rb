class VideosController < ApplicationController
  layout "player"
  def show
    @video = Video.includes(:user).find(params[:id])
  end
end
