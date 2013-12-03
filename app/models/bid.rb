class Bid < ActiveRecord::Base
  validates :price, :bidder, :event_id, presence: true
  belongs_to :event
end
