module UsersHelper
  # 

   #my own current user method
   #in helper because I need to access it from different controllers and views
  def current_user
  
          
    if session[:user_id]  != nil
     #@sign_in =true
     @user_name = User.where(id: session[:user_id]).first
     @user_first_name = User.find_by(id: session[:user_id]).first_name
    # @sign_in = User.find_by(id: session[:user_id]).last_name
     @user_last_name = User.find_by(id: session[:user_id]).last_name
     
      
     @user_email = User.find_by(id: session[:user_id]).email
     @user_id= User.find_by_email(@user_email).id
     return true
    else 
  # @sign_in=false
   return false
    #@helper ="helper works"
  end
  
      
    @helper ="helper works"
  end

end
