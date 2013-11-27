class TixesController < ApplicationController
  before_action :set_tix, only: [:show, :edit, :update, :destroy]

  # GET /tixes
  # GET /tixes.json
  def index
    @tixes = Tix.all
    @tix = Tix.new
    @eventtypes = Eventtype.all
    @locations = Location.all
  end

  # GET /tixes/1
  # GET /tixes/1.json
  def show
  end

  # GET /tixes/new
  def new
    @tix = Tix.new
    @eventtypes = Eventtype.all
    @locations = Location.all
  end

  # GET /tixes/1/edit
  def edit
    @eventtypes = Eventtype.all
    @locations = Location.all
  end

  # POST /tixes
  # POST /tixes.json
  def create
    @tix = Tix.new(tix_params)

    respond_to do |format|
      if @tix.save
        format.html { redirect_to tixes_path, notice: 'Tix was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tix }
      else
        format.html { render action: 'new' }
        format.json { render json: @tix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tixes/1
  # PATCH/PUT /tixes/1.json
  def update
    respond_to do |format|
      if @tix.update(tix_params)
        format.html { redirect_to tixes_path, notice: 'Tix was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tixes/1
  # DELETE /tixes/1.json
  def destroy
    @tix.destroy
    respond_to do |format|
      format.html { redirect_to tixes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tix
      @tix = Tix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tix_params
      params.require(:tix).permit(:eventname, :eventtype, :location, :price)
    end
end
