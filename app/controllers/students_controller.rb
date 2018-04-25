class StudentsController < ApplicationController
#include is inheritence to get the contents of the helper. 
#This is to avoid writing repetative code and is therefore achieveing DRYness
include UsersHelper

  before_action :set_student, only: [:show, :edit, :update, :destroy], except: [:parent_filter]
  
  
  #extra security the username for teacher will have a name+surname
  #does not work ath the moment fix later
  #def current_user
   # User.where(id: session[:user_id]).first
  #end
   #@user = current_user

  #promt protecting pages in this controller (but save later to maek secure)
  #do not use on public computers the passwor is rememberd
 
   #extra security the password for teacher will have a password + the date = each day different
   @date = Time.now.strftime("%e")
   ###uncomment at the end
  #http_basic_authenticate_with :name => "@user", :password => @date + "12345"
  

def search
      #need to get the currnet user in order to display in the header
   ###@user = current_user
    
  @search_term = params[:q]
 #@the search term is what will be presented in q
  st ="%#{params[:q]}%"
  #seatchterm will be used to search in students table searchin for the first name here
  @students = Student.where("email like (?) or surname like (?) or school like (?)", st, st, st)
end

=begin delete later = depriciatedS
def filter
  #:filter is column in the schema table filters
    st = params[:filter]
    #now compare that filter name with student
    @students= Student.where("school like ? ", st)
end
=end

def pfilter
  #add if the current user email matches the pfilter email the show (maybe in views)
    #st = params[:pfilter] (this does not work with emails for some reason)
    st ="%#{params[:pfilter]}%"
    #now compare that filter name with student
    @students= Student.where("school like (?) or surname like (?) or email like (?)",st,st, st) #
    #display all the pfilters
    #@pfilters = Pfilter.all
    #displaying currnet user
    #@user = current_user.email
    #display the pfilters with the current user
    #@pfilters= Pfilter.where("email like ? ", @user) 
   # @students= Student.where("school like ? ", st)

end
def parent_filter
  @pfilters = Pfilter.all
    
   #add if the current user email matches the pfilter email the show (maybe in views)
    st = params[:pfilter]
    #now compare that filter name with student
    @students= Student.where("school like (?) or surname like (?) or email like (?)",st,st, st) #
    #display all the pfilters
    #@pfilters = Pfilter.all
    #displaying currnet user
    #@user = current_user.email
    #display the pfilters with the current user
    #@pfilters= Pfilter.where("email like ? ", @user) 
   # @students= Student.where("school like ? ", st)

end


  # GET /students
  # GET /students.json
  def index
    
    #calling all the addon functions
    #@pfilters = Pfilter.all
    @students = Student.all
    @filters = Filter.all
    
    ##Here we personalise filters so that each user will have their own unique filte
    #displaying currnet user
  ###  @user_email = current_user.email
 ###   @user = current_user
 st=@user_email
    #display the pfilters with the current user
    @pfilters= Pfilter.where("email like ? ", st) 
    
    #name = "Vadim"
    #@students= Student.where("name like ? ", name)
    #add this gem later
    #@items = Item.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /students/1
  # GET /students/1.json
  def show
    #need to get the currnet user in order to display in the header
  ###  @user = current_user
      
    #getting a firstname and surname to prefill in the _form
  ###  @user_first_name= current_user.first_name
  ###  @user_last_name= current_user.last_name
      
  end

  # GET /students/new
  def new
    #need to get the currnet user in order to display in the header
  @user = current_user
      

    
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    #need to get the currnet user in order to display in the header
  ###  @user = current_user
      
    #getting a firstname and surname to prefill in the _form
  ###  @user_first_name= current_user.first_name
  ###  @user_last_name= current_user.last_name
  end
#
  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json#
  def destroy
    #@student= Student.find(params[:id])
    #Result.where("email like ? ", @student.email ).delete_all
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
#
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :surname, :day_of_birth, :month_of_birth, :year_of_birth, :school, :email, :comment)
    end
end
