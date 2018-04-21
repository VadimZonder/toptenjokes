module UsersHelper
  # 

   #my own current user method
   #in helper because I need to access it from different controllers and views
  def current_user
  

    if session[:user_id]  != nil
   
     return true
    else 
  # @sign_in=false
   return false
    #@helper ="helper works"
  end
  
   
  end
  
  
  

end
