class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end





  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = @current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
    render 'books'
    end
  
  end




  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
    redirect_to book_path(@book.id)
    else

      render 'edit'
    end
  end




  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end




 private

  def book_params
    params.permit(:title, :body, :user_id)
  end
end
