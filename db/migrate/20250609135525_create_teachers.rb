class CreateTeachers < ActiveRecord::Migration[7.2]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      # NOTE: had to modify so that it would point to subjects table and not main_subjects
      t.references :main_subject, null: false, foreign_key: { to_table: :subjects }

      t.timestamps
    end
  end
end
