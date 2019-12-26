class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(15)
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  def edit
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id, hour: "10:00:00")
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
