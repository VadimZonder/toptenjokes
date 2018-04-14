class StaticPagesController < ActionController::Base

  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home
    # def current_user
    if session[:user_id]  != nil
     @sign_in =true
     @user_name = User.where(id: session[:user_id]).first
     @user_email = User.find_by(id: session[:user_id]).email
     @user_id= User.find_by_email(@user_email).id
    else 
    @sign_in=false
    
    
   
   #def current_user
   # User.where(id: session[:user_id]).first
   #end

  

 # @usr = User.find_by(id: session[:user_id])
 # @usr2 = User.where(id: session[:user_id]).first
 # @usr3 = User.find_by(id: session[:user_id]).email
 
    
   end
   
  
   @time = Time.now.strftime("%B %e, %Y at %I:%M %p")
    

   #@user = current_user

  end
  

  
#(if from browser /sample is called)
def sample
@controller_message = "Hello From Controller"
end
 #(when in views var will be called)


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
