class UsersController < ApplicationController
  
#(if from browser /users is called)
def users
end


#(if from browser /parent is called)
def parent
@users_message = "I am a parent"
end
 #(when in views var will be called)

#(if from browser /principal is called)
def principal
@user_message = "I am a princila/admin"
end
 #(when in views var will be called)
 
 #(if from browser /teacher is called)
def teacher
@user_message = "I am a teacher"
end
 #(when in views var will be called)
 
 #(if from browser /student is called)
def student
@user_message = "I am a student"
end
 #(when in views var will be called)
  


 
 #TRYIBG TO ACHIVE ONE USERS ONE VIEW
=begin
@users_message = "I am a user"

@which_user = "I am a user"

@url = request.original_url

if @url == "https://ejournal-vadimmalakhovski.c9users.io/parent"
  @which_user = "I am a parent"
elsif @url == "https://ejournal-vadimmalakhovski.c9users.io/teacher"
   @which_user = "I am a teacher"
elsif @url == "https://ejournal-vadimmalakhovski.c9users.io/principal"
   @which_user = "I am a principal" 
elsif @url == "https://ejournal-vadimmalakhovski.c9users.io/student"
   @which_user = "I am a student"   
else
   @which_user = "Unidentified User"
end
end
=end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
