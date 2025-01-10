class BooksController < ApplicationController
  def new
    @book= Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました"
      redirect_to '/books'
    else
      flash.now[:notice] = "投稿に失敗しました"
      render :new
    end
  end
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "編集に成功しました"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "編集に失敗しました"
    end
  end 

  def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
