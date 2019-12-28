class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.destroy
    redirect_to root_path
  end
end
