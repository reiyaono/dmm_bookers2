class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = current_user.books.new
    @book.title =  params[:title] || params[:book][:title]
    @book.body = params[:body] || params[:book][:body]
    if @book.save
      redirect_to book_path(@book.id), flash: { success: "You've created book successfully." }
    else
      @user = current_user
      @books = current_user.books
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path if @book.user != current_user
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), flash: { success: "You've updated book successfully." }
  end

  def destroy
    Book.find(params[:id]).delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
