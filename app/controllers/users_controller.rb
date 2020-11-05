class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path if @user != current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), flash: { success: "You've updated user successfully." }
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
