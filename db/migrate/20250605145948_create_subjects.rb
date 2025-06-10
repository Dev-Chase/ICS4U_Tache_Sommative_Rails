class CreateSubjects < ActiveRecord::Migration[7.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
