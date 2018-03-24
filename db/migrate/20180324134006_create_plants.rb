class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :timestamps
      t.string :scientific_name
      t.string :common_name
      t.integer :light

      t.timestamps
    end
  end
end
