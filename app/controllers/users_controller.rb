class UsersController < ApplicationController
    before_action :current_user, only: [:edit, :update]

    def show
      @book = Book.new
      @user = User.find(params[:id])
      @books = @user.books
    end

    def index
      @book = Book.new
      @users = User.all
      @user = current_user
    end

    def edit
      @user = User.find(params[:id])
    end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

    def update
      @user =  User.find(params[:id])
      if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
      else
      render :edit
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end

end
















