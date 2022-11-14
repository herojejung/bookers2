class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    user.user_id = current_user.id
    user.save
    redirect_to books_path
  end

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:succsess] = "You have updated user successfully."
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
