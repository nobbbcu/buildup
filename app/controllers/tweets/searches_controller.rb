class Tweets::SearchesController < ApplicationController
  def index
    @tweets = Tweet.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
  end
end
