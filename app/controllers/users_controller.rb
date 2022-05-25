class UsersController < ApplicationController

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @users = @user.books
    @user = current_user

  end

  def edit
    @user = User.find(params[:id])
    @user = current_user

  end

  def update
    @user = User.find(params[:id])
    @user.update
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
end
