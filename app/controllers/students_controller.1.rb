class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  
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
  http_basic_authenticate_with :name => "@user", :password => @date + "12345"


def search
  @search_term = params[:q]
 #@the search term is what will be presented in q
  st ="%#{params[:q]}%"
  #seatchterm will be used to search in students table searchin for the first name here
  @students = Student.where("name like (?) or surname like (?) or school like (?)", st, st, st)
end


def filter
  #:filter is column in the schema table filters
    st = params[:filter]
    #now compare that filter name with student
    @students= Student.where("school like ? ", st)

end



  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @filters = Filter.all
    #name = "Vadim"
    #@students= Student.where("name like ? ", name)
    #add this gem later
    #@items = Item.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /students/1
  # GET /students/1.json
  def show
    #getting an id of a student
    @URI = request.original_url
    @URI = @URI.split('/').last 
      
  end

  # GET /students/new
  #renders a page at students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  #a POST form to create a student
  #then to have a form add student view new.html.erb and make a form with vars that you need
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
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
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
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


end
