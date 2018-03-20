class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :scientific_name
      t.string :common_name
      t.string :type
      t.integer :light
    end
  end
end
