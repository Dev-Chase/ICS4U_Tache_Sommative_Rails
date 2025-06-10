class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :grade_level
      t.integer :grade_average
      t.string :emergency_contact
      t.integer :credits_obtained

      t.timestamps
    end
  end
end
