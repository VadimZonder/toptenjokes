class StaticPagesController < ActionController::Base

#include is inheritence to get the contents of the helper. 
#This is to avoid writing repetative code and is therefore achieveing DRYness
include UsersHelper

   
  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home

  
       #getting a firstname and surname to prefill in the _form
 # @user_first_name= current_user
 # @user_last_name= current_user
 # @user_email= current_user
  #@user_id= current_user 
   
   #def current_user
   # User.where(id: session[:user_id]).first
   #end

  

 # @usr = User.find_by(id: session[:user_id])
 # @usr2 = User.where(id: session[:user_id]).first
 # @usr3 = User.find_by(id: session[:user_id]).email
 
    
   
   
  
   @time = Time.now.strftime("%B %e, %Y at %I:%M %p")
    

   #@user = current_user

  end
  

  
#(if from browser /sample is called)
def about

end
 #(when in views var will be called)


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
