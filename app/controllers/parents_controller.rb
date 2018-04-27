class ParentsController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_student, only: [:show]
    before_action :set_result, only: [:show, :edit, :update, :destroy], except: [:parent_filter, :index]
    #include is inheritence to get the contents of the helper. 
    #This is to avoid writing repetative code and is therefore achieveing DRYness
    include UsersHelper  


    def lfilter
        ##fixed BUG fix the lfiter by email it is vital function
        #add if the current user email matches the pfilter email the show (maybe in views) fixed!!!
        #st = params[:lfilter] (this does not work with emails for some reason)
        st ="%#{params[:lfilter]}%"
        #now compare that filter name with student
        @students= Student.where("surname like (?) or email like (?)",st, st) #
        #display all the pfilters
        #@pfilters = Pfilter.all
    end
    
    def parent_result
        @results= Result.all
        #get the current URI once on this page
        @URI = request.original_url
        #split the URI to get everything after the = sign
        @URI = @URI.split('=').last
        #take the % sign out of the string
        @URI = @URI.tr('%', '')
        #get everything befor 40 and everything after 40
        @splitEmailF =  @URI.split("40").first
        @splitEmailL =  @URI.split("40").last
        # to add between first and last in order to reconstruct the email
        @at="@"  
        @st=@splitEmailF.to_s+@at.to_s+@splitEmailL.to_s
        #saving the reconstructed email into a variable
        st=@splitEmailF.to_s+@at.to_s+@splitEmailL.to_s
        #searching the DB to match all the results of a student with the unique email
        @results= Result.where("email like ? ",st)    
    end
    
   def parent_search
      @search_term = params[:q]
      #@the search term is what will be presented in q
      st ="%#{params[:q]}%"
      #seatchterm will be used to search in students table searchin for the first name here
      @students = Student.where("surname like (?) or email like (?)", st, st)
 
    #returning all the results in the DB for all the students
    #@results = Result.all
    
    #get the current URI once on this page
    @URI = request.original_url
    #split the URI to get everything after the = sign
    @URI = @URI.split('=').last
    #take the % sign out of the string
    @URI = @URI.tr('%', '')
    #get everything befor 40 and everything after 40
    @splitEmailF =  @URI.split("40").first
    @splitEmailL =  @URI.split("40").last
    # to add between first and last in order to reconstruct the email
    @at="@"  
    @st=@splitEmailF.to_s+@at.to_s+@splitEmailL.to_s
    #saving the reconstructed email into a variable
    st=@splitEmailF.to_s+@at.to_s+@splitEmailL.to_s
    #searching the DB to match all the results of a student with the unique email
    @results= Result.where("email like ? ",st)
   end


    def parent_filter
       #add if the current user email matches the pfilter email the show (maybe in views)
        st = params[:pfilter]
        #now compare that filter name with student
        @students= Student.where("school like (?) or surname like (?) or email like (?)",st,st, st) #
        #BUG cant categorise by email from student DB (works with other params)
        #:filter is column in the schema table filters
        #name = params[:filter]
        #surname = params[:filter]
        #now compare that filter name with student
         #@students= Student.where("name like (?)" name.
        #where("user_id is not in (?)",[user_ids])
        #@students= Student.where("surname like (?)",surname)
        
        #make it work
        #email = "arthur@hotmail.com"
        #@students=Student.where("email like (?)",email)
    
    end
    
    def parent_pfilter
        #BUG cant categorise by email from student DB (works with other params)
        #:filter is column in the schema table filters
        #name = params[:filter]
        surname = params[:filter]
        #now compare that filter name with student
         #@students= Student.where("name like (?)" name.
      #where("user_id is not in (?)",[user_ids])
        @students= Student.where("surname like (?)",surname)
        
        #make it work
        #email = "arthur@hotmail.com"
        #@students=Student.where("email like (?)",email)
    
    end
    
    def index
         @students = Student.all
         @parent_filters = ParentFilter.all
         #@pfilters=Pfilter.all
         
        ##Here we personalise filters so that each user will have their own unique filter
        #displaying currnet user
        #the @vars are now available in views
        
        #user to be accessable on all of the pages
        @user = current_user
        #user_email for search purposes
        #@user_email = current_user.email
        #display the pfilters with the current user
        @lfilters= Lfilter.where("email like ? ", @user_email)  
    end
    



 private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :surname, :day_of_birth, :month_of_birth, :year_of_birth, :school, :email, :comment)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:date_time, :classes, :teacher, :grade, :email, :comment)
    end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
