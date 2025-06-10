class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :code
      t.integer :floor_level
      t.references :building, null: false, foreign_key: true
      t.string :directions

      t.timestamps
    end
  end
end
