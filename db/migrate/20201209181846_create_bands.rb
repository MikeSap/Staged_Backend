class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :city
      t.string :url
      t.string :bio
      

      t.timestamps
    end
  end
end
