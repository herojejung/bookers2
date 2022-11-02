class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to books_path
  end

  def index

  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:title, :body, :image)
  end

end
