class ResultsController < ApplicationController
 #granting and limmiting access for different methods  
 before_action :set_result, only: [:show, :edit, :update, :destroy], except: [:parent_result, :update, :edit, :destroy]

#display results from newest to oldest = .order("created_at DESC").all
#cannot add new result, maybe because all results of filters ar eon 1 page .order("created_at DESC").all
  # GET /results
  # GET /results.json
  def index
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
    #searching the DB to match all the results of a student with the unique email and displaying newst first
    @results= Result.order("created_at DESC").where("email like ? ",st)
    
    #try change to just @resilts and to = Result.where("email like ? ",st)
    @resultsChart= Result.where("email like ? ",st)

  end
  
  def current_student
    #add latter the reults of all the students
    
  end

def parent_result
  #results for parents. Here is simplified because there was no need for extra steps like in index
  @URI = request.original_url
  #split the URI to get everything after the / sign
  @URI = @URI.split('/').last
  @URI = @URI.to_s
  st=@URI
  #searching the DB to match all the results of a student with the unique email and displaying newst first
   @results= Result.order("created_at DESC").where("email like ? ",st)
  
  
  #try change to just @resilts and to = Result.where("email like ? ",st)
    @resultsChart= Result.where("email like ? ",st)
end
def teacher_result
  #results for parents. Here is simplified because there was no need for extra steps like in index
  @URI = request.original_url
  #split the URI to get everything after the / sign
  @URI = @URI.split('/').last
  @URI = @URI.to_s
  st=@URI
  #searching the DB to match all the results of a student with the unique email and displaying newst first
   @results= Result.order("created_at DESC").where("email like ? ",st)
  
  
  #try change to just @resilts and to = Result.where("email like ? ",st)
    @resultsChart= Result.where("email like ? ",st)
end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:date_time, :classes, :teacher, :grade, :email, :parent_email, :comment)
    end
end
