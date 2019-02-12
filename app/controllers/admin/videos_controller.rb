class Admin::VideosController < Admin::ApplicationAdminController
  before_action :set_video, only:[:show, :destroy, :edit, :update]

  def index
    if current_user.has_role? :admin
      @videos = Video.includes(:user).
                paginate(page: params[:page]).
                order(updated_at: :desc)
    else
      @videos = Video.includes(:user).
                where(user_id: current_user.id).
                paginate(page: params[:page]).
                order(updated_at: :desc)
    end
  end

  def show

  end

  def destroy
    if @video.destroy
      redirect_to admin_videos_path
    end
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_videos_path
    else
      render :new, notice: @video.errors
    end
  end

  def edit

  end

  def update
    if @video.update(video_params)
      redirect_to admin_videos_path
    else
      render :edit, notice: @video.errors
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :url).merge(user: current_user)
  end
end
