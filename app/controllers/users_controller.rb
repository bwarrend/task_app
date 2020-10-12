class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
    :password, :sort_by, :show_complete, :show_incomplete, :group_by_date))
    @user.update_attribute(:sort_by, 1)
    @user.update_attribute(:show_complete, true)
    @user.update_attribute(:show_incomplete, true)
    @user.update_attribute(:group_by_date, false)
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end


  
end
