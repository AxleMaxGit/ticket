class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.string :bidder
      t.integer :event_id

      t.timestamps
    end
  end
end
