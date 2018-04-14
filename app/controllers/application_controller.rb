class ApplicationController < ActionController::Base
#a limiter to redirect a user to login page if one is trying to acces protected pages unless login or registration is clicked themselves  
before_filter :login_first, :except => [:new,:create]



#method to redirect a user to login  page
private
  def login_first
    unless current_user
      redirect_to login_url
    end
  end

   #def current_user
   # User.where(id: session[:user_id]).first
   #end

  

  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end