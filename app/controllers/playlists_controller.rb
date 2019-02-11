class PlaylistsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @playlist = Video.where(user_id: params[:id]).
                      paginate(page: params[:page], per_page: 4).
                      order(updated_at: :desc)
  end
end
