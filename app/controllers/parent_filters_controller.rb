class ParentFiltersController < ApplicationController
  before_action :set_parent_filter, only: [:show, :edit, :update, :destroy]

  # GET /parent_filters
  # GET /parent_filters.json
  def index
    @parent_filters = ParentFilter.all
  end

  # GET /parent_filters/1
  # GET /parent_filters/1.json
  def show
  end

  # GET /parent_filters/new
  def new
    @parent_filter = ParentFilter.new
  end

  # GET /parent_filters/1/edit
  def edit
  end

  # POST /parent_filters
  # POST /parent_filters.json
  def create
    @parent_filter = ParentFilter.new(parent_filter_params)

    respond_to do |format|
      if @parent_filter.save
        format.html { redirect_to @parent_filter, notice: 'Parent filter was successfully created.' }
        format.json { render :show, status: :created, location: @parent_filter }
      else
        format.html { render :new }
        format.json { render json: @parent_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_filters/1
  # PATCH/PUT /parent_filters/1.json
  def update
    respond_to do |format|
      if @parent_filter.update(parent_filter_params)
        format.html { redirect_to @parent_filter, notice: 'Parent filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_filter }
      else
        format.html { render :edit }
        format.json { render json: @parent_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_filters/1
  # DELETE /parent_filters/1.json
  def destroy
    @parent_filter.destroy
    respond_to do |format|
      format.html { redirect_to parent_filters_url, notice: 'Parent filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_filter
      @parent_filter = ParentFilter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_filter_params
      params.require(:parent_filter).permit(:filter)
    end
end
