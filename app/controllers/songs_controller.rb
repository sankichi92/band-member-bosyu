class SongsController < ApplicationController
  before_action :require_current_user, only: %i[new create]

  def index
    @songs = Song.all.reverse_order
  end

  def show
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

  private

  def song_params
    params.require(:song).permit(:name, :artist, :url, :notes)
  end
end
