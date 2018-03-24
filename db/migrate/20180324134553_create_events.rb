class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :timestamps
      t.belongs_to :plant, foreign_key: true

      t.timestamps
    end
  end
end
