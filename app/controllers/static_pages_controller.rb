class StaticPagesController < ActionController::Base
 #include is inheritence to get the contents of the helper. 
 #This is to avoid writing repetative code and is therefore achieveing DRYness
 include UsersHelper

   
  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home
   @time = Time.now.strftime("%B %e, %Y at %I:%M %p")
  end

 def about
 
 end
 
 def policy
 
 end
 
 def contact
 
 end
 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
