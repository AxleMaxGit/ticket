class TicketsController < ApplicationController

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @bids = Bid.all
    @top_bids = []

    @bids.each do |n|
      if @top_bids[n.event_id].nil?
        @top_bids[n.event_id] = n.price
      else
        if n.price > @top_bids[n.event_id]
          @top_bids[n.event_id] = n.price
        end
      end      
    end  
  end

  def show
    @bids = Bid.where("event_id = ?", (params[:id]))
    @customers = Customer.all
  end

  def new
  end

  def edit
  end

  def create
    @bid = Bid.new(ticket_params)
    if @bid.save { redirect_to tickets_path, notice: 'Tix was successfully created.' }
    end
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit( :price)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:price, :bidder, :event_id)
    end

end