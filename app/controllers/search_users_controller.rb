class SearchUsersController < ApplicationController
  def index
    if params[:email].present?
      @users = User.search_by_email(params[:email]).paginate(page: params[:page], per_page: 4)
      redirect_to playlist_path(@users[0].id) if @users.count == 1
    end
  end
end
