class ParentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


#(if from browser /login is called)
def login
@parent = "Sing in"
end


#(if from browser /parent is called)
def loggedin
@parent = "I am a singed in"
end

#(if from browser /parent is called)
def loggedout
@parent = "I am a singed out"
end




  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
