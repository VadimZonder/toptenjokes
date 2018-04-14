class StaticPagesController < ActionController::Base

  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home
   
   def current_user
    User.where(id: session[:user_id]).first
   end
   @time = Time.now.strftime("%B %e, %Y at %I:%M %p")
    

   @user = current_user

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
