class BooksController < ApplicationController

  def new
  	 @book = Book.new
  end

  def index
  	@books = Book.all
  	@user = current_user
  	@book = Book.new
  	@users = User.all



  end

  def show
  	@book = Book.find(params[:id])
  	@user = @book.user
  	@boook = Book.new

  end

  def create
  	 book = Book.new(book_params)
  	 book.user_id = current_user.id
  	 if book.save
  	 	flash[:notice]="Successfully"
  	  redirect_to book_path(book.id)
  	else
  	@books = Book.all
  	 @user = current_user
     @book = Book.new
     @bookerror =book
  	 render:index
     end

 end


  def edit
  	@book = Book.find(params[:id])
    if current_user != @book.user
    redirect_to books_path
    end
  end

  def update
  	 book = Book.find(params[:id])
     Book.update(book_params)
     	flash[:notice]="Successfully"
     redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def top
  	
  end
  private
    def book_params
        params.require(:book).permit(:title, :body, :user_id,:image)
  end
end
