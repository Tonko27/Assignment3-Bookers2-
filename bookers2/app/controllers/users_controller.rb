class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
  end



  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = @current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end





  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
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