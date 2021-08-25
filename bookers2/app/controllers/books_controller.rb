class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:success] = 'Successfully'
    redirect_to book_path(@new_book.id)
    else
      flash.now[:danger] = 'Error'
    render 'books/index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Successfully'
    redirect_to book_path(@book.id)
    else
      flash.now[:danger] = 'Error'
      render 'books/edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
