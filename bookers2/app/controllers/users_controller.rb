class UsersController < ApplicationController
  def index
    @new_book = Book.new
    @users = User.all
  end
  
  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = @current_user.id
    if @book.save
      flash.now[:success] =  'Successfully'
    redirect_to book_path(@book.id)
    else
      flash.now[:danger] = 'Error'
    render 'books/index'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash.now[:success] =  'Successfully'
    redirect_to user_path(@user.id)
    else
    flash.now[:danger] = 'Error'
    render 'users/edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end