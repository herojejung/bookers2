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
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:title, :body, :image)
  end

end
