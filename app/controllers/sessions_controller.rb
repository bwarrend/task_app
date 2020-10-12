class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    @sort_method = 1

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/welcome'
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end

  def sort_by_category
    User.find_by(id: session[:user_id]).update_attribute(:sort_by, 4)
    redirect_to '/welcome'
  end

  def sort_by_created_at
    User.find_by(id: session[:user_id]).update_attribute(:sort_by, 1)
    redirect_to '/welcome'
  end

  def sort_by_due_date
      User.find_by(id: session[:user_id]).update_attribute(:sort_by, 2)
      redirect_to '/welcome'
  end

  def sort_by_title
      User.find_by(id: session[:user_id]).update_attribute(:sort_by, 3)
      redirect_to '/welcome'
  end

  def sort_by_category
      User.find_by(id: session[:user_id]).update_attribute(:sort_by, 4)
      redirect_to '/welcome'
  end

  def sort_by_status
    User.find_by(id: session[:user_id]).update_attribute(:sort_by, 5)
    redirect_to '/welcome'
  end

  def sort_by_description
    User.find_by(id: session[:user_id]).update_attribute(:sort_by, 6)
    redirect_to '/welcome'
  end

  def toggle_show_complete
    User.find_by(id: session[:user_id]).update_attribute(:show_complete, !User.find_by(id: session[:user_id]).show_complete)
    redirect_to '/welcome'
  end

  def toggle_show_incomplete
    User.find_by(id: session[:user_id]).update_attribute(:show_incomplete, !User.find_by(id: session[:user_id]).show_incomplete)
    redirect_to '/welcome'
  end


end
