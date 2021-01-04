class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :url
      t.string :event_type
      t.string :location
      t.integer :band_id

      t.timestamps
    end
  end
end
