class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      flash[:errors] = 'Book Created Successfully'
      redirect_to books_path
    else
      flash[:errors] = @book.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:errors] = 'Book Updated Successfully'
      redirect_to book_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to edit_book_path
    end
  end

  def destroy
    if @book.delete
      flash[:success] = 'Book Deleted Successfully'
      redirect_to root_path(@book)
    else
      flash[:errors] = @book.errors.full_messages
      redirect_to destroy_book_path
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :price, :published_date)
  end
end
