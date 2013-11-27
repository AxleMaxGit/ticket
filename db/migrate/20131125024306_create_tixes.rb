class CreateTixes < ActiveRecord::Migration
  def change
    create_table :tixes do |t|
      t.string :eventname
      t.string :eventtype
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
