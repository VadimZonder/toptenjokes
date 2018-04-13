class PfiltersController < ApplicationController
  before_action :set_pfilter, only: [:show, :edit, :update, :destroy]

  # GET /pfilters
  # GET /pfilters.json
  def index
    @pfilters = Pfilter.all
  end

  # GET /pfilters/1
  # GET /pfilters/1.json
  def show
  end

  # GET /pfilters/new
  def new
    @pfilter = Pfilter.new
  end

  # GET /pfilters/1/edit
  def edit
  end

  # POST /pfilters
  # POST /pfilters.json
  def create
    @pfilter = Pfilter.new(pfilter_params)

    respond_to do |format|
      if @pfilter.save
        format.html { redirect_to @pfilter, notice: 'Pfilter was successfully created.' }
        format.json { render :show, status: :created, location: @pfilter }
      else
        format.html { render :new }
        format.json { render json: @pfilter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pfilters/1
  # PATCH/PUT /pfilters/1.json
  def update
    respond_to do |format|
      if @pfilter.update(pfilter_params)
        format.html { redirect_to @pfilter, notice: 'Pfilter was successfully updated.' }
        format.json { render :show, status: :ok, location: @pfilter }
      else
        format.html { render :edit }
        format.json { render json: @pfilter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pfilters/1
  # DELETE /pfilters/1.json
  def destroy
    @pfilter.destroy
    respond_to do |format|
      format.html { redirect_to pfilters_url, notice: 'Pfilter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pfilter
      @pfilter = Pfilter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pfilter_params
      params.require(:pfilter).permit(:pfilter, :email)
    end
end
