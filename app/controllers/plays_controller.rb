class PlaysController < ApplicationController
  before_action :require_current_user
  before_action :require_play_owner, only: %i[edit update destroy]

  def new
    song = Song.find(params[:song_id])
    @play = song.plays.new
  end

  def create
    song = Song.find(params[:song_id])
    @play = song.plays.new(play_params.merge(user: current_user))

    if @play.save
      redirect_to song, notice: '参加登録しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @play.update(play_params)
      redirect_to @play.song, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @play.destroy!
    redirect_to @play.song, notice: '削除しました'
  end

  private

  def require_play_owner
    @play = Play.find(params[:id])
    redirect_to @play.song, alert: '権限がありません' unless @play.owner?(current_user)
  end

  def play_params
    params.require(:play).permit(:instrument, :comment)
  end
end
