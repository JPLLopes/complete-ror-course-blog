class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you have successfully signed up."
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_content
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account was succesfully updated."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end