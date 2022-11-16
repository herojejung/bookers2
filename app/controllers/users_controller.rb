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
    @user = User.find(params[:id])
    @books = @user.books
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  if @book.user == current_user
    render "users/edit"
  else
    redirect_to users_path
  end
　end

  def update
    user = User.find(params[:id])
  if  user.update(user_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(user.id)
  else
    @user = User.find(params[:id])
    @user.update(user_params)
    render :'users/edit'
  end
  end

  private

  def user_params
    params.require(:user).permit(:image,:name,:introduction)
  end
  end
end
