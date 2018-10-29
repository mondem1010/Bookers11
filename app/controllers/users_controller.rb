class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  	  # @users = User.all
  	  @user = User.find(params[:id])
  	  @book = Book.new
  	  @books = @user.books
  end
  
  def index
  	  @users = User.all
  	  @user = current_user
  	  @book = Book.new
  end
  
  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice]="Successfully"
  	redirect_to user_path
  	else

    render :edit
    end

  end
  def edit
  	@user = current_user
  end
  def template


  end
  private 
def user_params
    params.require(:user).permit(:name, :introduction, :image)
end
end