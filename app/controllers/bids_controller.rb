class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
    @customers = Customer.all
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)


    #if there are no previous bids set high_bid value to 0 for comparison
    if Bid.where("event_id = ?", @bid.event_id).empty?
      @prev_high_bid = 0
    else
      #check the highest bid so far (for comparison)
      @prev_high_bid = Bid.where("event_id = ?", @bid.event_id).order(price: :asc).last.price
    end

    #if the bid is high enough then save
    if @bid.price > @prev_high_bid
      puts "This bid is higher"
      @bid.save
      redirect_to "/tickets/#{@bid.event_id}", notice: 'Bid was successfully created.'
    #otherwise reject the bid
    else
      puts "This bid is NOT high enough!!"
      redirect_to "/tickets/#{@bid.event_id}", notice: 'FAIL!!!  You must enter the highest bid to win!!.'
    end


    # respond_to do |format|
    #   if @bid.save
    #     format.html { redirect_to "/tickets/#{@bid.event_id}", notice: 'Bid was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @bid }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @bid.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:price, :bidder, :event_id)
    end
end
