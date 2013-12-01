class Bid < ActiveRecord::Base
  validates :price, :bidder, :event_id, presence: true
end
