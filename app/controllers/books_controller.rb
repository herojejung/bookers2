class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        flash[:succsess] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        @user = current_user
        @books = Book.all
        render :index
      end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "books/edit"
    else
      @user = current_user
      redirect_to book_path
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      @book.update(book_params)
      render :'books/edit'
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
end


end
