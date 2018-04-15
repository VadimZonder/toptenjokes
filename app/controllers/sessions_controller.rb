class SessionsController < ApplicationController
 # skip_before_filter :login_first
#when login link is pressed the new method is triggered
  def new
   # @user = User.find params[:id]
      
  end
  
    def error
      
     
 
    end
  
  
#whenever the login button is pressed after entering email and password this method is triggerd  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_url #, notice: 'Logged in!'
 
    else

     #flash.keep[:notice]="This message will persist"
      #redirect_to login_url, notice: 'Logged in!'
    #flash[:notice] = 'Please make alsways sure that the login details are correct'
      #render :new
      
       url = request.path_info
    if url.include?('session')
    flash[:notice] = 'Please make alsways sure that the login details are correct'
  else
    
  end
    end
  end
  def destroy

    session[:user_id] = nil
    redirect_to root_url #, notice: 'Logged out!'
  end
  
  
end
