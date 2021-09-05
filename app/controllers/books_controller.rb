class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.user = current_user
    if book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(book)
    else
      render :edit
    end
  end



  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
