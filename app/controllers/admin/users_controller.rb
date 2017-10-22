class Admin::UsersController < ApplicationController

  def index
    @users = User.includes(:groups).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to :admin_user_path
    else
      render "edit"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user.save
  end

  protected

  def user_params
    params_require(:user).permit(:email, :group_ids => [])
  end

end
