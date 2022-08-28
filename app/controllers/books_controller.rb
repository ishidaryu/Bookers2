class BooksController < ApplicationController

  def index
     @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find_by(id: params[:id])
    @user= current_user
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

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    redirect_to books_index_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def currect_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end