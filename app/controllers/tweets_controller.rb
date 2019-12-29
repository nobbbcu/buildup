class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :show, :about]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(15)
    @like = Like.new
  end

  def about
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    @like = Like.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to root_path
    else
      render :show
    end
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
