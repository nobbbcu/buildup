class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = user
    @tweets = user.tweets.order("created_at DESC").page(params[:page]).per(15)
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to action: :show
  end


  private
  def user_params
    params.require(:user).permit(:image, :name, :email, :introduction)
  end
end
