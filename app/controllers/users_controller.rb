class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :find_user

   def show
   end

  def edit
    #@user = current_user
  end

  def update
    #@user = current_user

    if @user.update(user_params)
      flash[:notice] = "修改成功"
      redirect_to edit_user_path
    else
      render "edit"
    end
  end

  protected

  def find_user
    @user = current_user
    @user.create_profile unless @user.profile
  end 

  def user_params
    params.require(:user).permit(:time_zone, :profile_attributes => [:id, :legal_name, :birthday, :location, :edution, :occupation, :bio, :specialty])
  end

end
