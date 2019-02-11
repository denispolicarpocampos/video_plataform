class VideoClicksController < ApplicationController

  def show
    video_click = VideoClick.where(video_id: params[:id]).count
    render json: { counter: video_click }
  end

  def create
    video_click = VideoClick.new(video_click_params)
    if video_click.save
      render json: video_click, status: :created
    else
      render json: { errors: video_click.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def video_click_params
    params.require(:video_click).permit(:video_id)
  end
end
