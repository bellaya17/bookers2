class BooksController < ApplicationController
  
  def index
    @book =Book.new
    @user = User.find(params[:id])
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end
  
  
  def edit
  end

  def update
  end



  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
