class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :eventtype
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
