class SongsController < ApplicationController
  before_action :require_current_user, only: %i[new create edit update destroy]
  before_action :require_song_owner, only: %i[edit update destroy]

  def index
    @songs = Song.all.reverse_order
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params.merge(user: current_user))

    if @song.save
      redirect_to root_path, notice: '曲を追加しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @song.destroy
      redirect_to root_path, notice: "#{@song.title} を削除しました"
    else
      redirect_to @song, alert: @song.errors.full_messages.join(' / ')
    end
  end

  private

  def require_song_owner
    @song = Song.find(params[:id])
    redirect_to @song, alert: '権限がありません' unless @song.owner?(current_user)
  end

  def song_params
    params.require(:song).permit(:name, :artist, :url, :notes, :closed)
  end
end
