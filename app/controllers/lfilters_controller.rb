class LfiltersController < ApplicationController
before_action :set_lfilter, only: [:show, :edit, :update, :destroy]


  # GET /lfilters
  # GET /lfilters.json
  def index
    #@lfilters = Lfilter.all
    ##Here we personalise filters so that each user will have their own unique filter
    #displaying currnet user
    @user_first_name = User.find_by(id: session[:user_id]).first_name

    #display the pfilters with the current user
    @lfilters= Lfilter.where("email like ? ", @user_email) 
  end

  # GET /lfilters/1
  # GET /lfilters/1.json
  def show
    @user_first_name = User.find_by(id: session[:user_id]).first_name
    @user_id= User.find_by(id: session[:user_id]).id
  end

  # GET /lfilters/new
  def new
    @user_first_name = User.find_by(id: session[:user_id]).first_name
    @user_id= User.find_by(id: session[:user_id]).id
    @lfilter = Lfilter.new
  end


  # GET /pfilters/1/edit
  def edit
    @user_first_name = User.find_by(id: session[:user_id]).first_name
    @user_id= User.find_by(id: session[:user_id]).id
  end
  
  # POST /lfilters
  # POST /lfilters.json
  def create
    @lfilter = Lfilter.new(lfilter_params)

    respond_to do |format|
      if @lfilter.save
        format.html { redirect_to parents_url, notice: 'Filter was successfully created.' }
        format.json { render :show, status: :created, location: @lfilter }
      else
        format.html { render :new }
        format.json { render json: @lfilter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lfilters/1
  # PATCH/PUT /lfilters/1.json
  def update
    respond_to do |format|
      if @lfilter.update(lfilter_params)
        format.html { redirect_to parents_url, notice: 'Filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @lfilter }
      else
        format.html { render :edit }
        format.json { render json: @lfilter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lfilters/1
  # DELETE /lfilters/1.json
  def destroy
    @lfilter.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lfilter
      @lfilter = Lfilter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lfilter_params
      params.require(:lfilter).permit(:lfilter, :email)
    end
end
